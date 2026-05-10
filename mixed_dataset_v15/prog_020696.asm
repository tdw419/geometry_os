; DESCRIPTION: Composite: Renders a yellow line between points (265, 52) and (45, 45) then Renders a green disk with center (205, 44) and radius 38.
; PLAN: r0=265(x1), r1=52(y1), r2=45(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=44(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 265
LDI r1, 52
LDI r2, 45
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 44
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
