; DESCRIPTION: Places a cyan line segment connecting (345, 254) to (253, 159).
; PLAN: r0=345(x1), r1=254(y1), r2=253(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 254
LDI r2, 253
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
