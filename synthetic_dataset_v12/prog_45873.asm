; DESCRIPTION: Renders a cyan line between points (253, 179) and (332, 26).
; PLAN: r0=253(x1), r1=179(y1), r2=332(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 179
LDI r2, 332
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
