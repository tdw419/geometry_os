; DESCRIPTION: Renders a orange line between points (228, 129) and (293, 176).
; PLAN: r0=228(x1), r1=129(y1), r2=293(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 129
LDI r2, 293
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
