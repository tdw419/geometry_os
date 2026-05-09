; DESCRIPTION: Draws a orange line from (230, 209) to (200, 179).
; PLAN: r0=230(x1), r1=209(y1), r2=200(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 209
LDI r2, 200
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
