; DESCRIPTION: Renders a orange line between points (179, 242) and (167, 80).
; PLAN: r0=179(x1), r1=242(y1), r2=167(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 242
LDI r2, 167
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
