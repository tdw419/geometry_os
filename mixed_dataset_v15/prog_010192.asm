; DESCRIPTION: Renders a orange line between points (354, 182) and (30, 126).
; PLAN: r0=354(x1), r1=182(y1), r2=30(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 182
LDI r2, 30
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
