; DESCRIPTION: Composite: Places a green dot at position (260, 48) then Renders a white disk with center (434, 124) and radius 53 then Draws a orange line from (137, 108) to (24, 240).
; PLAN: r0=260(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=124(y), r7=53(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=137(x1), r11=108(y1), r12=24(x2), r13=240(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 48
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 434
LDI r6, 124
LDI r7, 53
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 137
LDI r11, 108
LDI r12, 24
LDI r13, 240
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
