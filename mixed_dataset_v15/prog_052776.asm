; DESCRIPTION: Draws a blue line from (365, 239) to (83, 219).
; PLAN: r0=365(x1), r1=239(y1), r2=83(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 239
LDI r2, 83
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
