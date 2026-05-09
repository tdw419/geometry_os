; DESCRIPTION: Renders a cyan line between points (14, 14) and (21, 47).
; PLAN: r0=14(x1), r1=14(y1), r2=21(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 14
LDI r2, 21
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
