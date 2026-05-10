; DESCRIPTION: Composite: Renders a purple box of size 19x11 starting at (277, 93) then Places a yellow dot at position (134, 133) then Draws a cyan circle centered at (34, 156) with radius 25.
; PLAN: r0=277(x), r1=93(y), r2=19(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=134(x), r6=133(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=34(x), r11=156(y), r12=25(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 277
LDI r1, 93
LDI r2, 19
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 133
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 34
LDI r11, 156
LDI r12, 25
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
