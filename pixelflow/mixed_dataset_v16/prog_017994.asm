; DESCRIPTION: Renders a cyan line between points (172, 138) and (358, 180).
; PLAN: r0=172(x1), r1=138(y1), r2=358(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 138
LDI r2, 358
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
