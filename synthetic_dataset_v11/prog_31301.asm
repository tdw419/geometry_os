; DESCRIPTION: Draws a purple line from (106, 28) to (215, 215).
; PLAN: r0=106(x1), r1=28(y1), r2=215(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 28
LDI r2, 215
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
