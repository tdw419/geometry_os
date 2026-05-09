; DESCRIPTION: Renders a cyan line between points (39, 94) and (36, 203).
; PLAN: r0=39(x1), r1=94(y1), r2=36(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 94
LDI r2, 36
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
