; DESCRIPTION: Draws a purple line from (270, 39) to (365, 239).
; PLAN: r0=270(x1), r1=39(y1), r2=365(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 39
LDI r2, 365
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
