; DESCRIPTION: Renders a cyan line between points (0, 38) and (8, 109).
; PLAN: r0=0(x1), r1=38(y1), r2=8(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 38
LDI r2, 8
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
