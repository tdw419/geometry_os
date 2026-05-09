; DESCRIPTION: Draws a black line from (99, 207) to (205, 218).
; PLAN: r0=99(x1), r1=207(y1), r2=205(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 207
LDI r2, 205
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
