; DESCRIPTION: Composite: Renders a red disk with center (421, 139) and radius 48 then Draws a green line from (19, 184) to (120, 130).
; PLAN: r0=421(x), r1=139(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x1), r6=184(y1), r7=120(x2), r8=130(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 139
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 184
LDI r7, 120
LDI r8, 130
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
