; DESCRIPTION: Places a cyan line segment connecting (427, 16) to (439, 197).
; PLAN: r0=427(x1), r1=16(y1), r2=439(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 16
LDI r2, 439
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
