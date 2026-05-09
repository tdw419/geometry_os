; DESCRIPTION: Draws a blue line from (87, 247) to (498, 203).
; PLAN: r0=87(x1), r1=247(y1), r2=498(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 247
LDI r2, 498
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
