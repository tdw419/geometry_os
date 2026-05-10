; DESCRIPTION: Composite: Renders a blue box of size 110x89 starting at (303, 52) then Renders a yellow line between points (244, 19) and (337, 236) then Places a black dot at position (82, 2).
; PLAN: r0=303(x), r1=52(y), r2=110(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x1), r6=19(y1), r7=337(x2), r8=236(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=82(x), r11=2(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 303
LDI r1, 52
LDI r2, 110
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 19
LDI r7, 337
LDI r8, 236
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 2
LDI r12, 0x000000
PSET r10, r11, r12
HALT
