; DESCRIPTION: Composite: Creates a white circular shape at (412, 60) with radius 42 then Sets a single white pixel at (252, 205) then Renders a orange line between points (194, 117) and (411, 178).
; PLAN: r0=412(x), r1=60(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x), r6=205(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=194(x1), r11=117(y1), r12=411(x2), r13=178(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 412
LDI r1, 60
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 205
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 194
LDI r11, 117
LDI r12, 411
LDI r13, 178
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
