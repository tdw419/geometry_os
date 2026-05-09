; DESCRIPTION: Renders a orange line between points (228, 74) and (111, 18).
; PLAN: r0=228(x1), r1=74(y1), r2=111(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 74
LDI r2, 111
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
