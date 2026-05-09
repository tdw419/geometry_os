; DESCRIPTION: Renders a orange line between points (374, 216) and (422, 173).
; PLAN: r0=374(x1), r1=216(y1), r2=422(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 216
LDI r2, 422
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
