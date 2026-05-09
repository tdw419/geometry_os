; DESCRIPTION: Renders a cyan line between points (457, 105) and (228, 10).
; PLAN: r0=457(x1), r1=105(y1), r2=228(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 105
LDI r2, 228
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
