; DESCRIPTION: Composite: Places a green dot at position (206, 174) then Places a green line segment connecting (57, 255) to (461, 69) then Renders a purple disk with center (204, 90) and radius 47.
; PLAN: r0=206(x), r1=174(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=57(x1), r6=255(y1), r7=461(x2), r8=69(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=204(x), r11=90(y), r12=47(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 206
LDI r1, 174
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 57
LDI r6, 255
LDI r7, 461
LDI r8, 69
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 204
LDI r11, 90
LDI r12, 47
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
