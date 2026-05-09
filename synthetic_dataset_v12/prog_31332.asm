; DESCRIPTION: Composite: Places a orange circle of radius 75 at center (429, 150) then Sets a single white pixel at (201, 203) then Places a white 110x109 rectangle at position (161, 18).
; PLAN: r0=429(x), r1=150(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=203(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=161(x), r11=18(y), r12=110(width), r13=109(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 150
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 203
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 161
LDI r11, 18
LDI r12, 110
LDI r13, 109
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
