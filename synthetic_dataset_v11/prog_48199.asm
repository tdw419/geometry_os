; DESCRIPTION: Renders a cyan line between points (228, 36) and (78, 77).
; PLAN: r0=228(x1), r1=36(y1), r2=78(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 36
LDI r2, 78
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
