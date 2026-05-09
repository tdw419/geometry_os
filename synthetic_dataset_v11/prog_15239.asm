; DESCRIPTION: Places a cyan line segment connecting (32, 144) to (115, 159).
; PLAN: r0=32(x1), r1=144(y1), r2=115(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 144
LDI r2, 115
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
