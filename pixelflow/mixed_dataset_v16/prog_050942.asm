; DESCRIPTION: Draws a blue line from (240, 30) to (254, 176).
; PLAN: r0=240(x1), r1=30(y1), r2=254(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 30
LDI r2, 254
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
