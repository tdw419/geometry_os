; DESCRIPTION: Renders a cyan line between points (49, 47) and (96, 12).
; PLAN: r0=49(x1), r1=47(y1), r2=96(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 47
LDI r2, 96
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
