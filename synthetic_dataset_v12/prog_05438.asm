; DESCRIPTION: Renders a cyan line between points (259, 88) and (380, 35).
; PLAN: r0=259(x1), r1=88(y1), r2=380(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 88
LDI r2, 380
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
