; DESCRIPTION: Renders a orange line between points (351, 173) and (130, 107).
; PLAN: r0=351(x1), r1=173(y1), r2=130(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 173
LDI r2, 130
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
