; DESCRIPTION: Composite: Renders a white line between points (185, 175) and (479, 36) then Creates a green circular shape at (63, 116) with radius 29.
; PLAN: r0=185(x1), r1=175(y1), r2=479(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=116(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 185
LDI r1, 175
LDI r2, 479
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 116
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
