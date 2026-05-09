; DESCRIPTION: Renders a orange line between points (274, 67) and (386, 120).
; PLAN: r0=274(x1), r1=67(y1), r2=386(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 67
LDI r2, 386
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
