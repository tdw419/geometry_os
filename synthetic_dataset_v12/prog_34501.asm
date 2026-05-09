; DESCRIPTION: Composite: Renders a green disk with center (360, 205) and radius 35 then Sets a single black pixel at (206, 135) then Places a green 72x65 rectangle at position (179, 170).
; PLAN: r0=360(x), r1=205(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=135(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=179(x), r11=170(y), r12=72(width), r13=65(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 205
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 135
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 179
LDI r11, 170
LDI r12, 72
LDI r13, 65
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
