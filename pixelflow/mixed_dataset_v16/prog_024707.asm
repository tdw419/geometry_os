; DESCRIPTION: Composite: Renders a black disk with center (205, 114) and radius 48 then Draws a green line from (142, 91) to (196, 66).
; PLAN: r0=205(x), r1=114(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x1), r6=91(y1), r7=196(x2), r8=66(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 114
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 91
LDI r7, 196
LDI r8, 66
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
