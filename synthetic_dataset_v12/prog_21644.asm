; DESCRIPTION: Renders a black line between points (78, 101) and (228, 127).
; PLAN: r0=78(x1), r1=101(y1), r2=228(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 101
LDI r2, 228
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
