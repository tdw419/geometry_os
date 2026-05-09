; DESCRIPTION: Draws a magenta line from (198, 13) to (90, 114).
; PLAN: r0=198(x1), r1=13(y1), r2=90(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 13
LDI r2, 90
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
