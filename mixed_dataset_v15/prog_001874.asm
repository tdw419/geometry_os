; DESCRIPTION: Composite: Renders a cyan disk with center (15, 212) and radius 14 then Places a blue line segment connecting (133, 172) to (310, 83) then Places a green dot at position (402, 235).
; PLAN: r0=15(x), r1=212(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x1), r6=172(y1), r7=310(x2), r8=83(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=402(x), r11=235(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 15
LDI r1, 212
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 172
LDI r7, 310
LDI r8, 83
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 235
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
