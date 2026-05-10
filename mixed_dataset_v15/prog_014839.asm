; DESCRIPTION: Renders a cyan line between points (65, 12) and (172, 102).
; PLAN: r0=65(x1), r1=12(y1), r2=172(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 12
LDI r2, 172
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
