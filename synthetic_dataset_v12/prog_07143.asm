; DESCRIPTION: Composite: Renders a blue disk with center (417, 103) and radius 69 then Places a yellow line segment connecting (349, 162) to (129, 228).
; PLAN: r0=417(x), r1=103(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x1), r6=162(y1), r7=129(x2), r8=228(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 103
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 162
LDI r7, 129
LDI r8, 228
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
