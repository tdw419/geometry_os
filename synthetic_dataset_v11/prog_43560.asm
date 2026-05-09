; DESCRIPTION: Draws a blue line from (126, 212) to (115, 239).
; PLAN: r0=126(x1), r1=212(y1), r2=115(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 212
LDI r2, 115
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
