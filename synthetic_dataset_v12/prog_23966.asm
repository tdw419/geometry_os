; DESCRIPTION: Composite: Places a black 112x22 rectangle at position (236, 103) then Draws a yellow line from (125, 137) to (337, 251) then Sets a single magenta pixel at (17, 127).
; PLAN: r0=236(x), r1=103(y), r2=112(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x1), r6=137(y1), r7=337(x2), r8=251(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=17(x), r11=127(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 236
LDI r1, 103
LDI r2, 112
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 137
LDI r7, 337
LDI r8, 251
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 17
LDI r11, 127
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
