; DESCRIPTION: Composite: Places a blue circle of radius 46 at center (345, 64) then Places a cyan dot at position (194, 75) then Renders a white box of size 59x84 starting at (442, 127).
; PLAN: r0=345(x), r1=64(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=75(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=442(x), r11=127(y), r12=59(width), r13=84(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 64
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 75
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 442
LDI r11, 127
LDI r12, 59
LDI r13, 84
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
