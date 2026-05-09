; DESCRIPTION: Renders a cyan line between points (112, 66) and (97, 219).
; PLAN: r0=112(x1), r1=66(y1), r2=97(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 66
LDI r2, 97
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
