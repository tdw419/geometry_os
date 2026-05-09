; DESCRIPTION: Draws a black line from (76, 162) to (425, 218).
; PLAN: r0=76(x1), r1=162(y1), r2=425(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 162
LDI r2, 425
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
