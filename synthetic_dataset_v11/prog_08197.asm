; DESCRIPTION: Renders a magenta line between points (88, 197) and (198, 157).
; PLAN: r0=88(x1), r1=197(y1), r2=198(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 197
LDI r2, 198
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
