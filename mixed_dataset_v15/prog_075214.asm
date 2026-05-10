; DESCRIPTION: Composite: Places a green line segment connecting (194, 203) to (207, 69) then Renders a cyan disk with center (293, 155) and radius 37 then Places a yellow dot at position (48, 13).
; PLAN: r0=194(x1), r1=203(y1), r2=207(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=155(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=48(x), r11=13(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 194
LDI r1, 203
LDI r2, 207
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 155
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 48
LDI r11, 13
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
