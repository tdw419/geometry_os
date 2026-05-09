; DESCRIPTION: Renders a cyan line between points (73, 175) and (253, 8).
; PLAN: r0=73(x1), r1=175(y1), r2=253(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 175
LDI r2, 253
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
