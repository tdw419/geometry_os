; DESCRIPTION: Draws a green line from (301, 130) to (129, 105).
; PLAN: r0=301(x1), r1=130(y1), r2=129(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 130
LDI r2, 129
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
