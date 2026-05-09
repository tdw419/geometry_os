; DESCRIPTION: Draws a green line from (199, 172) to (397, 98).
; PLAN: r0=199(x1), r1=172(y1), r2=397(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 172
LDI r2, 397
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
