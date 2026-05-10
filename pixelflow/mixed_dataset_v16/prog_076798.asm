; DESCRIPTION: Draws a white line from (20, 148) to (182, 76).
; PLAN: r0=20(x1), r1=148(y1), r2=182(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 148
LDI r2, 182
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
