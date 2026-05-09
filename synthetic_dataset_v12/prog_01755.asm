; DESCRIPTION: Draws a yellow line from (186, 143) to (455, 24).
; PLAN: r0=186(x1), r1=143(y1), r2=455(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 143
LDI r2, 455
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
