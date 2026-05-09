; DESCRIPTION: Renders a cyan line between points (112, 128) and (417, 194).
; PLAN: r0=112(x1), r1=128(y1), r2=417(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 128
LDI r2, 417
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
