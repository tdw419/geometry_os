; DESCRIPTION: Renders a cyan line between points (458, 185) and (463, 41).
; PLAN: r0=458(x1), r1=185(y1), r2=463(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 185
LDI r2, 463
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
