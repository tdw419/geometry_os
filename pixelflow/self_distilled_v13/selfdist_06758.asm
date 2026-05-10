; DESCRIPTION: Renders a cyan line segment connecting (0, 159) to (370, 191).
; PLAN: r0=0(x1), r1=159(y1), r2=370(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 159
LDI r2, 370
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
