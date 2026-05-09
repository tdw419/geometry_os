; DESCRIPTION: Composite: Places a black line segment connecting (329, 245) to (124, 144) then Renders a cyan disk with center (270, 166) and radius 56.
; PLAN: r0=329(x1), r1=245(y1), r2=124(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=166(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 245
LDI r2, 124
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 166
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
