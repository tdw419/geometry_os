; DESCRIPTION: Renders a cyan line between points (59, 77) and (237, 78).
; PLAN: r0=59(x1), r1=77(y1), r2=237(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 77
LDI r2, 237
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
