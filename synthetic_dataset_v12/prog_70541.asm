; DESCRIPTION: Renders a red line between points (143, 0) and (485, 30).
; PLAN: r0=143(x1), r1=0(y1), r2=485(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 0
LDI r2, 485
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
