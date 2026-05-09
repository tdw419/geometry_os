; DESCRIPTION: Draws a red line from (288, 33) to (421, 45).
; PLAN: r0=288(x1), r1=33(y1), r2=421(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 33
LDI r2, 421
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
