; DESCRIPTION: Draws a white line from (397, 162) to (13, 223).
; PLAN: r0=397(x1), r1=162(y1), r2=13(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 162
LDI r2, 13
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
