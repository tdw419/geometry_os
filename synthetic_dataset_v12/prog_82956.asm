; DESCRIPTION: Renders a cyan line between points (485, 167) and (458, 61).
; PLAN: r0=485(x1), r1=167(y1), r2=458(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 167
LDI r2, 458
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
