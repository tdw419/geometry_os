; DESCRIPTION: Renders a red line between points (168, 100) and (167, 176).
; PLAN: r0=168(x1), r1=100(y1), r2=167(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 100
LDI r2, 167
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
