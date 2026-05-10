; DESCRIPTION: Renders a green line segment connecting (19, 39) to (278, 156).
; PLAN: r0=19(x1), r1=39(y1), r2=278(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 39
LDI r2, 278
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
