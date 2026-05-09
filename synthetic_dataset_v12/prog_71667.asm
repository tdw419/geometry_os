; DESCRIPTION: Renders a magenta line between points (298, 40) and (359, 208).
; PLAN: r0=298(x1), r1=40(y1), r2=359(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 40
LDI r2, 359
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
