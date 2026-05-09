; DESCRIPTION: Composite: Renders a blue disk with center (417, 69) and radius 64 then Places a white dot at position (192, 173) then Draws a black line from (415, 12) to (109, 250).
; PLAN: r0=417(x), r1=69(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=173(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=415(x1), r11=12(y1), r12=109(x2), r13=250(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 69
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 173
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 415
LDI r11, 12
LDI r12, 109
LDI r13, 250
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
