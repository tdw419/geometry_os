; DESCRIPTION: Draws a red line from (449, 33) to (457, 234).
; PLAN: r0=449(x1), r1=33(y1), r2=457(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 33
LDI r2, 457
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
