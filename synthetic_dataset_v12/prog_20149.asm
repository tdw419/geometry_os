; DESCRIPTION: Composite: Places a blue 99x11 rectangle at position (103, 20) then Draws a white circle centered at (282, 189) with radius 33 then Sets a single orange pixel at (143, 148).
; PLAN: r0=103(x), r1=20(y), r2=99(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x), r6=189(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x), r11=148(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 103
LDI r1, 20
LDI r2, 99
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 189
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 148
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
