; DESCRIPTION: Places a blue line segment connecting (4, 221) to (128, 46).
; PLAN: r0=4(x1), r1=221(y1), r2=128(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 221
LDI r2, 128
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
