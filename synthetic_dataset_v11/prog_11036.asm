; DESCRIPTION: Draws a yellow line from (86, 187) to (27, 254).
; PLAN: r0=86(x1), r1=187(y1), r2=27(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 187
LDI r2, 27
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
