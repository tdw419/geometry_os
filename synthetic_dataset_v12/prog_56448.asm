; DESCRIPTION: Draws a white line from (0, 33) to (20, 45).
; PLAN: r0=0(x1), r1=33(y1), r2=20(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 33
LDI r2, 20
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
