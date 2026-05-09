; DESCRIPTION: Places a green line segment connecting (16, 10) to (81, 189).
; PLAN: r0=16(x1), r1=10(y1), r2=81(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 10
LDI r2, 81
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
