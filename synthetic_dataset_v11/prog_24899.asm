; DESCRIPTION: Places a cyan line segment connecting (225, 128) to (144, 159).
; PLAN: r0=225(x1), r1=128(y1), r2=144(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 128
LDI r2, 144
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
