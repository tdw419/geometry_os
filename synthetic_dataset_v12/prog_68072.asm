; DESCRIPTION: Places a cyan line segment connecting (323, 144) to (24, 220).
; PLAN: r0=323(x1), r1=144(y1), r2=24(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 144
LDI r2, 24
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
