; DESCRIPTION: Renders a red line between points (164, 195) and (16, 78).
; PLAN: r0=164(x1), r1=195(y1), r2=16(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 195
LDI r2, 16
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
