; DESCRIPTION: Renders a cyan line between points (17, 180) and (167, 181).
; PLAN: r0=17(x1), r1=180(y1), r2=167(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 180
LDI r2, 167
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
