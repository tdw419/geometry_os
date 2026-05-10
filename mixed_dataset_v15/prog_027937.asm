; DESCRIPTION: Renders a magenta line between points (17, 45) and (370, 255).
; PLAN: r0=17(x1), r1=45(y1), r2=370(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 45
LDI r2, 370
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
