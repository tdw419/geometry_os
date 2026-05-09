; DESCRIPTION: Draws a blue line from (27, 72) to (46, 1).
; PLAN: r0=27(x1), r1=72(y1), r2=46(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 72
LDI r2, 46
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
