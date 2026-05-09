; DESCRIPTION: Renders a orange line between points (90, 176) and (410, 176).
; PLAN: r0=90(x1), r1=176(y1), r2=410(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 176
LDI r2, 410
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
