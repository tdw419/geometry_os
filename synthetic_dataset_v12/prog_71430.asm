; DESCRIPTION: Draws a blue line from (368, 52) to (104, 37).
; PLAN: r0=368(x1), r1=52(y1), r2=104(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 52
LDI r2, 104
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
