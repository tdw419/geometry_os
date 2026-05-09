; DESCRIPTION: Places a cyan line segment connecting (195, 144) to (183, 15).
; PLAN: r0=195(x1), r1=144(y1), r2=183(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 144
LDI r2, 183
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
