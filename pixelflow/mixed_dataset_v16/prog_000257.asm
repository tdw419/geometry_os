; DESCRIPTION: Renders a cyan line segment connecting (148, 122) to (337, 15).
; PLAN: r0=148(x1), r1=122(y1), r2=337(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 122
LDI r2, 337
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
