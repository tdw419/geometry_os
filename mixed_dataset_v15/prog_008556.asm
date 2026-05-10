; DESCRIPTION: Renders a orange line between points (120, 67) and (374, 117).
; PLAN: r0=120(x1), r1=67(y1), r2=374(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 67
LDI r2, 374
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
