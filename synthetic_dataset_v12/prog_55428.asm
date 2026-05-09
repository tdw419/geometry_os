; DESCRIPTION: Renders a cyan line between points (97, 157) and (266, 25).
; PLAN: r0=97(x1), r1=157(y1), r2=266(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 157
LDI r2, 266
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
