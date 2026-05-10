; DESCRIPTION: Renders a cyan line between points (106, 87) and (81, 43).
; PLAN: r0=106(x1), r1=87(y1), r2=81(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 87
LDI r2, 81
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
