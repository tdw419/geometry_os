; DESCRIPTION: Places a cyan line segment connecting (45, 93) to (253, 129).
; PLAN: r0=45(x1), r1=93(y1), r2=253(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 93
LDI r2, 253
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
