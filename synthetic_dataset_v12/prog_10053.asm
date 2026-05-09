; DESCRIPTION: Draws a white line from (397, 139) to (87, 5).
; PLAN: r0=397(x1), r1=139(y1), r2=87(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 139
LDI r2, 87
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
