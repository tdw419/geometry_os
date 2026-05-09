; DESCRIPTION: Renders a cyan line between points (85, 38) and (43, 95).
; PLAN: r0=85(x1), r1=38(y1), r2=43(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 38
LDI r2, 43
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
