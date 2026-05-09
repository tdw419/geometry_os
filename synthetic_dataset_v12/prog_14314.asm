; DESCRIPTION: Draws a blue line from (367, 12) to (87, 191).
; PLAN: r0=367(x1), r1=12(y1), r2=87(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 12
LDI r2, 87
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
