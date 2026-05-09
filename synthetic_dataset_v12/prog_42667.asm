; DESCRIPTION: Renders a cyan line between points (204, 132) and (343, 19).
; PLAN: r0=204(x1), r1=132(y1), r2=343(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 132
LDI r2, 343
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
