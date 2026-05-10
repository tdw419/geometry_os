; DESCRIPTION: Composite: Sets a single red pixel at (302, 135) then Renders a white box of size 107x103 starting at (277, 135) then Creates a yellow circular shape at (206, 123) with radius 68.
; PLAN: r0=302(x), r1=135(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=135(y), r7=107(width), r8=103(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x), r11=123(y), r12=68(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 302
LDI r1, 135
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 277
LDI r6, 135
LDI r7, 107
LDI r8, 103
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 123
LDI r12, 68
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
