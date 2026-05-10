; DESCRIPTION: Renders a cyan line between points (496, 192) and (328, 23).
; PLAN: r0=496(x1), r1=192(y1), r2=328(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 192
LDI r2, 328
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
