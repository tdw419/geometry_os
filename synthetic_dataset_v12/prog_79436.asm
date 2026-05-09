; DESCRIPTION: Renders a cyan line between points (179, 102) and (347, 101).
; PLAN: r0=179(x1), r1=102(y1), r2=347(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 102
LDI r2, 347
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
