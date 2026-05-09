; DESCRIPTION: Composite: Places a magenta dot at position (20, 207) then Draws a white rectangle at (8, 46) with width 67 and height 95 then Renders a purple disk with center (53, 60) and radius 40.
; PLAN: r0=20(x), r1=207(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=8(x), r6=46(y), r7=67(width), r8=95(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=53(x), r11=60(y), r12=40(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 20
LDI r1, 207
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 8
LDI r6, 46
LDI r7, 67
LDI r8, 95
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 60
LDI r12, 40
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
