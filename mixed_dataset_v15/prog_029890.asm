; DESCRIPTION: Composite: Draws a black rectangle at (238, 115) with width 30 and height 46 then Sets a single cyan pixel at (73, 181) then Renders a magenta line between points (363, 114) and (259, 216).
; PLAN: r0=238(x), r1=115(y), r2=30(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=181(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=363(x1), r11=114(y1), r12=259(x2), r13=216(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 238
LDI r1, 115
LDI r2, 30
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 181
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 363
LDI r11, 114
LDI r12, 259
LDI r13, 216
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
