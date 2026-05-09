; DESCRIPTION: Composite: Places a red dot at position (266, 84) then Places a red circle of radius 60 at center (219, 185) then Renders a blue box of size 113x14 starting at (200, 178).
; PLAN: r0=266(x), r1=84(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=185(y), r7=60(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=200(x), r11=178(y), r12=113(width), r13=14(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 84
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 219
LDI r6, 185
LDI r7, 60
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 200
LDI r11, 178
LDI r12, 113
LDI r13, 14
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
