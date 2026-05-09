; DESCRIPTION: Places a green line segment connecting (372, 95) to (247, 170).
; PLAN: r0=372(x1), r1=95(y1), r2=247(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 95
LDI r2, 247
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
