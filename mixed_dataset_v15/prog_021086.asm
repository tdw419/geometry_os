; DESCRIPTION: Places a green line segment connecting (32, 225) to (394, 212).
; PLAN: r0=32(x1), r1=225(y1), r2=394(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 225
LDI r2, 394
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
