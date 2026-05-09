; DESCRIPTION: Draws a blue line from (203, 9) to (433, 187).
; PLAN: r0=203(x1), r1=9(y1), r2=433(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 9
LDI r2, 433
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
