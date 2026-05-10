; DESCRIPTION: Renders a green line between points (37, 29) and (268, 72).
; PLAN: r0=37(x1), r1=29(y1), r2=268(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 29
LDI r2, 268
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
