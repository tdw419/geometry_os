; DESCRIPTION: Draws a green line from (458, 87) to (254, 34).
; PLAN: r0=458(x1), r1=87(y1), r2=254(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 87
LDI r2, 254
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
