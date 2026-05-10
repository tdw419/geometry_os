; DESCRIPTION: Renders a green line segment connecting (225, 98) to (246, 65).
; PLAN: r0=225(x1), r1=98(y1), r2=246(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 98
LDI r2, 246
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
