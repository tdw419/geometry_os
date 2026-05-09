; DESCRIPTION: Draws a green line from (53, 212) to (254, 218).
; PLAN: r0=53(x1), r1=212(y1), r2=254(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 212
LDI r2, 254
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
