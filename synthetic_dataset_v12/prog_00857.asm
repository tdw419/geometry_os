; DESCRIPTION: Composite: Renders a black disk with center (69, 154) and radius 33 then Renders a magenta line between points (308, 35) and (180, 224).
; PLAN: r0=69(x), r1=154(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x1), r6=35(y1), r7=180(x2), r8=224(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 154
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 35
LDI r7, 180
LDI r8, 224
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
