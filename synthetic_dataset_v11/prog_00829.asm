; DESCRIPTION: Places a green line segment connecting (128, 196) to (190, 138).
; PLAN: r0=128(x1), r1=196(y1), r2=190(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 196
LDI r2, 190
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
