; DESCRIPTION: Renders a black line between points (83, 166) and (228, 18).
; PLAN: r0=83(x1), r1=166(y1), r2=228(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 166
LDI r2, 228
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
