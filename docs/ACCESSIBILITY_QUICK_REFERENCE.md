# Accessibility Quick Reference Guide

**Geometry OS Visual Shell - Keyboard & Screen Reader Support**

---

## For Users

### Essential Keyboard Shortcuts

#### Navigation
| Key | Action |
|-----|--------|
| **Tab** | Move to next element |
| **Shift+Tab** | Move to previous element |
| **F6** | Jump between major areas |
| **Shift+F6** | Jump backwards through areas |
| **Alt+1-6** | Jump to specific area directly |
| **Escape** | Close dialog / Go back |

#### Quick Access
| Key | Action |
|-----|--------|
| **H** | Show keyboard help |
| **Ctrl+Shift+H** | Toggle high contrast mode |
| **Ctrl+Shift+S** | Toggle screen reader enhancements |

### Application Areas

1. **Header** (Alt+1) - Application title and global info
2. **Process Spawner** (Alt+2) - Spawn and manage processes
3. **Visual Canvas** (Alt+3) - GPU memory visualization
4. **System Dashboard** (Alt+4) - Statistics and monitoring
5. **Task Bar** (Alt+5) - Window switching

### Canvas Navigation

When focused on the visual canvas:

| Key | Action |
|-----|--------|
| **Arrow Keys** | Pan the view |
| **Shift+Arrow** | Pan faster |
| **+ / =** | Zoom in |
| **- / _** | Zoom out |
| **Home** | Reset view |

### Process List Navigation

When in the process spawner:

| Key | Action |
|-----|--------|
| **Arrow Up/Down** | Navigate between processes |
| **Enter** | Focus selected process on canvas |
| **Space** | Select/deselect process |

### Screen Reader Tips

- **Loading**: Progress announced automatically
- **Zone Changes**: F6 navigation announced
- **Process Events**: Spawn/state changes announced
- **Canvas Position**: Announced during navigation
- **Errors**: Critical errors announced immediately

### Accessibility Modes

#### High Contrast Mode (Ctrl+Shift+H)
- Pure black/white color scheme
- Increased border visibility
- Enhanced focus indicators

#### Screen Reader Mode (Ctrl+Shift+S)
- Enhanced announcements
- Additional descriptive text
- Optimized live regions

---

## For Developers

### ARIA Labels Checklist

When adding new UI elements:

- [ ] Does it have an `aria-label` or `aria-labelledby`?
- [ ] Does it have an appropriate `role`?
- [ ] Is it keyboard accessible (tabindex)?
- [ ] Are state changes announced (aria-live)?
- [ ] Does it have visible focus indicators?

### Focus Management

```javascript
// Move focus programmatically
a11y.focusZone(FOCUS_ZONES.CANVAS);

// Announce to screen readers
a11y.announce('Process spawned successfully', 'polite');

// Register new focus zone
a11y.registerFocusZone('my-zone', {
    selector: '#my-element button',
    ariaLabel: 'My custom zone',
    onEnter: () => console.log('Entered zone')
});
```

### Creating Accessible Elements

```javascript
// Accessible button
const button = AccessibilityManager.createButton('Save', {
    label: 'Save current process state',
    onClick: () => save()
});

// Accessible dialog
const dialog = AccessibilityManager.createDialog(
    'confirm-dialog',
    'Confirm Action',
    '<p>Are you sure?</p>',
    { onClose: () => {} }
);

// Accessible tooltip
AccessibilityManager.createTooltip(element, 'Helpful info');

// Accessible status indicator
const status = AccessibilityManager.createStatusIndicator('Process', 'running');
status.setStatus('idle'); // Update status
```

### Testing Your Code

#### Quick Manual Tests

1. **Keyboard Only**
   - Unplug mouse
   - Navigate entire feature with Tab/Shift+Tab
   - Use arrow keys where appropriate
   - Verify all actions accessible

2. **Screen Reader**
   - Enable NVDA/VoiceOver
   - Navigate with screen reader commands
   - Verify announcements make sense
   - Check live region updates

3. **Visual Verification**
   - Enable high contrast mode
   - Check focus indicators visible
   - Verify color contrast
   - Test at 200% zoom

#### Automated Testing

```bash
# Run axe accessibility scan
npm run test:a11y

# Run pa11y
pa11y http://localhost:8080/visual_shell.html

# Lighthouse audit
lighthouse http://localhost:8080/visual_shell.html --only-categories=accessibility
```

### Common Patterns

#### Live Region Updates

```javascript
// For status updates (polite)
a11y.announce(`Process count: ${count}`, 'polite');

// For critical alerts (assertive)
a11y.announce('Error: Process crashed!', 'assertive');

// For content changes
a11y.announceContentChange('Process list', `${count} processes running`);
```

#### Focus Traps

```javascript
// Focus trap automatically applied to dialogs
const dialog = AccessibilityManager.createDialog(...);
document.body.appendChild(dialog);

// Focus first element
dialog.querySelector('button').focus();

// Escape key closes and returns focus
dialog.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') dialog.close();
});
```

#### Keyboard Event Handling

```javascript
element.addEventListener('keydown', (e) => {
    // Skip if in input
    if (e.target.tagName === 'INPUT') return;

    switch (e.key) {
        case 'Enter':
        case ' ':
            e.preventDefault();
            activate();
            break;
        case 'ArrowUp':
            e.preventDefault();
            navigateUp();
            break;
    }
});
```

---

## Troubleshooting

### Screen Reader Not Announcing

**Problem**: Screen reader doesn't announce updates

**Solutions**:
1. Check element has `aria-live` attribute
2. Verify content actually changed
3. Add brief delay before updating (100ms)
4. Ensure element is in DOM

### Focus Not Visible

**Problem**: Can't see where focus is

**Solutions**:
1. Add `.keyboard-navigation` class to body
2. Check CSS focus styles exist
3. Verify outline not removed
4. Test high contrast mode

### Keyboard Trap

**Problem**: Can't Tab away from element

**Solutions**:
1. Check for focus trap (dialog/modal)
2. Verify Escape key handler exists
3. Ensure no `tabindex="-1"` blocking
4. Check JavaScript focus management

### ARIA Not Working

**Problem**: ARIA attributes not recognized

**Solutions**:
1. Validate HTML syntax
2. Check attribute spelling
3. Verify element has proper role
4. Test with different screen reader

---

## Browser-Specific Notes

### Chrome + NVDA
- Best overall compatibility
- Live regions work well
- Focus management reliable

### Firefox + NVDA
- Excellent support
- May need delays for live regions
- Strong ARIA implementation

### Safari + VoiceOver
- Use semantic HTML
- May need `aria-live="assertive"` more often
- Focus management sometimes delayed

### Edge + JAWS
- Good compatibility
- Test focus indicators
- Verify live region timing

---

## Accessibility Resources

### Internal
- [Full Enhancement Summary](./ACCESSIBILITY_ENHANCEMENT_SUMMARY.md)
- [User Testing Plan](./ACCESSIBILITY_USER_TESTING_PLAN.md)
- [AccessibilityManager.js](../web/AccessibilityManager.js)

### External
- [WCAG 2.1 Quick Reference](https://www.w3.org/WAI/WCAG21/quickref/)
- [WAI-ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/)
- [MDN Accessibility](https://developer.mozilla.org/en-US/docs/Web/Accessibility)
- [WebAIM](https://webaim.org/)
- [A11y Project](https://www.a11yproject.com/)

---

## Support

**Found an accessibility issue?**

1. Check this guide first
2. Review [Enhancement Summary](./ACCESSIBILITY_ENHANCEMENT_SUMMARY.md)
3. Test with different browser/AT combination
4. Report issue with reproduction steps

**Contact**: Geometry OS Accessibility Team

---

*Last Updated: March 11, 2026*
