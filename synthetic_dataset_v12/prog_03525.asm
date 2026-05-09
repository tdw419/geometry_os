; DESCRIPTION: Renders a green line between points (510, 166) and (359, 69).
; PLAN: r0=510(x1), r1=166(y1), r2=359(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 166
LDI r2, 359
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
