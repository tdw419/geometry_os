; DESCRIPTION: Draws a green line from (60, 10) to (458, 206).
; PLAN: r0=60(x1), r1=10(y1), r2=458(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 10
LDI r2, 458
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
