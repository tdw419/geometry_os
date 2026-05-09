; DESCRIPTION: Renders a orange line between points (228, 53) and (481, 60).
; PLAN: r0=228(x1), r1=53(y1), r2=481(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 53
LDI r2, 481
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
