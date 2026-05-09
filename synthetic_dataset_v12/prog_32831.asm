; DESCRIPTION: Places a cyan line segment connecting (172, 144) to (36, 128).
; PLAN: r0=172(x1), r1=144(y1), r2=36(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 144
LDI r2, 36
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
