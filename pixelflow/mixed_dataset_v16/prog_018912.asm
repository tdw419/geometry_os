; DESCRIPTION: Renders a orange line between points (374, 109) and (16, 166).
; PLAN: r0=374(x1), r1=109(y1), r2=16(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 109
LDI r2, 16
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
