; DESCRIPTION: Composite: Creates a black circular shape at (205, 162) with radius 24 then Sets a single green pixel at (244, 208) then Renders a orange box of size 72x72 starting at (326, 76).
; PLAN: r0=205(x), r1=162(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=244(x), r6=208(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=326(x), r11=76(y), r12=72(width), r13=72(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 162
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 244
LDI r6, 208
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 326
LDI r11, 76
LDI r12, 72
LDI r13, 72
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
