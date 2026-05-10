; DESCRIPTION: Composite: Renders a green disk with center (453, 194) and radius 34 then Places a green dot at position (81, 248) then Places a blue 31x83 rectangle at position (81, 156).
; PLAN: r0=453(x), r1=194(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x), r6=248(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=81(x), r11=156(y), r12=31(width), r13=83(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 194
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 248
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 81
LDI r11, 156
LDI r12, 31
LDI r13, 83
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
