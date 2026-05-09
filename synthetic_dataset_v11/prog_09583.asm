; DESCRIPTION: Renders a yellow line between points (49, 79) and (198, 127).
; PLAN: r0=49(x1), r1=79(y1), r2=198(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 79
LDI r2, 198
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
