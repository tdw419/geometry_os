; DESCRIPTION: Composite: Renders a magenta line between points (188, 42) and (509, 185) then Renders a white disk with center (159, 49) and radius 32.
; PLAN: r0=188(x1), r1=42(y1), r2=509(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=49(y), r7=32(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 188
LDI r1, 42
LDI r2, 509
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 49
LDI r7, 32
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
