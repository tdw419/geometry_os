; DESCRIPTION: Renders a orange line between points (334, 197) and (230, 154).
; PLAN: r0=334(x1), r1=197(y1), r2=230(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 197
LDI r2, 230
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
