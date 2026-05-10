; DESCRIPTION: Draws a white line from (386, 155) to (397, 100).
; PLAN: r0=386(x1), r1=155(y1), r2=397(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 155
LDI r2, 397
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
