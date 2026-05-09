; DESCRIPTION: Composite: Places a green 45x80 rectangle at position (330, 148) then Places a white dot at position (407, 219) then Renders a purple disk with center (305, 149) and radius 47.
; PLAN: r0=330(x), r1=148(y), r2=45(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=219(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=305(x), r11=149(y), r12=47(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 330
LDI r1, 148
LDI r2, 45
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 219
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 305
LDI r11, 149
LDI r12, 47
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
