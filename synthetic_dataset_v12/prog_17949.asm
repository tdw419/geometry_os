; DESCRIPTION: Composite: Places a white 55x79 rectangle at position (32, 44) then Places a black line segment connecting (17, 150) to (317, 79) then Renders a orange disk with center (22, 231) and radius 12.
; PLAN: r0=32(x), r1=44(y), r2=55(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x1), r6=150(y1), r7=317(x2), r8=79(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=22(x), r11=231(y), r12=12(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 32
LDI r1, 44
LDI r2, 55
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 150
LDI r7, 317
LDI r8, 79
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 231
LDI r12, 12
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
