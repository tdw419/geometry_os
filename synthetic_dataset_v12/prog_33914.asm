; DESCRIPTION: Renders a cyan line between points (343, 2) and (372, 43).
; PLAN: r0=343(x1), r1=2(y1), r2=372(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 2
LDI r2, 372
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
