; DESCRIPTION: Places a magenta line segment connecting (98, 128) to (31, 192).
; PLAN: r0=98(x1), r1=128(y1), r2=31(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 128
LDI r2, 31
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
