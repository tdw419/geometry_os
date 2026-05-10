; DESCRIPTION: Draws a yellow line from (192, 149) to (362, 138).
; PLAN: r0=192(x1), r1=149(y1), r2=362(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 149
LDI r2, 362
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
