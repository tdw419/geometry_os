; DESCRIPTION: Composite: Renders a yellow box of size 11x40 starting at (40, 73) then Places a cyan circle of radius 52 at center (300, 185) then Places a white line segment connecting (394, 254) to (35, 23).
; PLAN: r0=40(x), r1=73(y), r2=11(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=185(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=394(x1), r11=254(y1), r12=35(x2), r13=23(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 40
LDI r1, 73
LDI r2, 11
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 185
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 394
LDI r11, 254
LDI r12, 35
LDI r13, 23
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
