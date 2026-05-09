; DESCRIPTION: Draws a white line from (172, 153) to (259, 45).
; PLAN: r0=172(x1), r1=153(y1), r2=259(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 153
LDI r2, 259
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
