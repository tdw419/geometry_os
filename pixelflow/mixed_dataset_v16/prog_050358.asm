; DESCRIPTION: Draws a white line from (397, 167) to (462, 20).
; PLAN: r0=397(x1), r1=167(y1), r2=462(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 167
LDI r2, 462
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
