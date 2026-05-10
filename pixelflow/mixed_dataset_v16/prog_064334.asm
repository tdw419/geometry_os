; DESCRIPTION: Places a yellow line segment connecting (397, 231) to (45, 95).
; PLAN: r0=397(x1), r1=231(y1), r2=45(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 231
LDI r2, 45
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
