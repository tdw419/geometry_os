; DESCRIPTION: Places a cyan line segment connecting (397, 164) to (200, 212).
; PLAN: r0=397(x1), r1=164(y1), r2=200(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 164
LDI r2, 200
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
