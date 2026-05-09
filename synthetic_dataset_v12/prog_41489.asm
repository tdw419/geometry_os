; DESCRIPTION: Renders a cyan line between points (88, 12) and (214, 31).
; PLAN: r0=88(x1), r1=12(y1), r2=214(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 12
LDI r2, 214
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
