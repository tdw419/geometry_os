; DESCRIPTION: Composite: Places a black line segment connecting (391, 91) to (239, 59) then Renders a blue disk with center (290, 188) and radius 26.
; PLAN: r0=391(x1), r1=91(y1), r2=239(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=290(x), r6=188(y), r7=26(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 391
LDI r1, 91
LDI r2, 239
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 188
LDI r7, 26
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
