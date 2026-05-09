; DESCRIPTION: Renders a cyan line between points (80, 6) and (78, 210).
; PLAN: r0=80(x1), r1=6(y1), r2=78(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 6
LDI r2, 78
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
