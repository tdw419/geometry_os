; DESCRIPTION: Renders a orange line between points (125, 228) and (205, 207).
; PLAN: r0=125(x1), r1=228(y1), r2=205(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 228
LDI r2, 205
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
