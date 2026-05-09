; DESCRIPTION: Renders a cyan line between points (179, 54) and (249, 248).
; PLAN: r0=179(x1), r1=54(y1), r2=249(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 54
LDI r2, 249
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
