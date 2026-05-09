; DESCRIPTION: Renders a yellow line between points (40, 210) and (268, 66).
; PLAN: r0=40(x1), r1=210(y1), r2=268(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 210
LDI r2, 268
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
