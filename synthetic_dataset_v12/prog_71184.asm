; DESCRIPTION: Renders a cyan line between points (348, 129) and (466, 185).
; PLAN: r0=348(x1), r1=129(y1), r2=466(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 129
LDI r2, 466
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
