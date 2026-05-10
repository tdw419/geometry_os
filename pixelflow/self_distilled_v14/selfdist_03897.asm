; DESCRIPTION: Renders a cyan line segment connecting (122, 4) to (29, 81).
; PLAN: r0=122(x1), r1=4(y1), r2=29(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 4
LDI r2, 29
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
