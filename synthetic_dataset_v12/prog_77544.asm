; DESCRIPTION: Composite: Draws a red circle centered at (126, 173) with radius 67 then Places a green 92x84 rectangle at position (113, 112).
; PLAN: r0=126(x), r1=173(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=112(y), r7=92(width), r8=84(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 173
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 112
LDI r7, 92
LDI r8, 84
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
