; DESCRIPTION: Composite: Renders a blue line between points (220, 190) and (126, 130) then Renders a orange disk with center (288, 143) and radius 45.
; PLAN: r0=220(x1), r1=190(y1), r2=126(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=143(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 220
LDI r1, 190
LDI r2, 126
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 143
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
