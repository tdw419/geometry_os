; DESCRIPTION: Composite: Creates a black rectangular region at (254, 207) spanning 42 by 46 pixels then Places a yellow circle of radius 39 at center (56, 70).
; PLAN: r0=254(x), r1=207(y), r2=42(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=70(y), r7=39(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 254
LDI r1, 207
LDI r2, 42
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 70
LDI r7, 39
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
