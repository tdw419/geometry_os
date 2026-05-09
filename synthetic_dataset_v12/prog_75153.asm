; DESCRIPTION: Places a cyan line segment connecting (100, 144) to (64, 115).
; PLAN: r0=100(x1), r1=144(y1), r2=64(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 144
LDI r2, 64
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
