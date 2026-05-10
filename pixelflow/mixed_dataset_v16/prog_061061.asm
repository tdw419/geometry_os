; DESCRIPTION: Composite: Draws a cyan circle centered at (277, 84) with radius 40 then Places a magenta 38x38 rectangle at position (228, 163).
; PLAN: r0=277(x), r1=84(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x), r6=163(y), r7=38(width), r8=38(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 84
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 163
LDI r7, 38
LDI r8, 38
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
