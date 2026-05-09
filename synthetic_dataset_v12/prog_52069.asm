; DESCRIPTION: Places a green line segment connecting (27, 96) to (192, 30).
; PLAN: r0=27(x1), r1=96(y1), r2=192(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 96
LDI r2, 192
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
