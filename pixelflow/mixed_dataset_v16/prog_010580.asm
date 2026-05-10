; DESCRIPTION: Renders a orange line between points (104, 90) and (422, 111).
; PLAN: r0=104(x1), r1=90(y1), r2=422(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 90
LDI r2, 422
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
