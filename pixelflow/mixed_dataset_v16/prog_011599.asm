; DESCRIPTION: Draws a white line from (102, 69) to (355, 238).
; PLAN: r0=102(x1), r1=69(y1), r2=355(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 69
LDI r2, 355
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
