; DESCRIPTION: Renders a cyan line between points (49, 7) and (252, 4).
; PLAN: r0=49(x1), r1=7(y1), r2=252(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 7
LDI r2, 252
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
