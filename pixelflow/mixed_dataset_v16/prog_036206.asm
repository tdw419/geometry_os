; DESCRIPTION: Draws a white line from (131, 69) to (244, 158).
; PLAN: r0=131(x1), r1=69(y1), r2=244(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 69
LDI r2, 244
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
