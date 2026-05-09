; DESCRIPTION: Composite: Creates a blue rectangular region at (224, 162) spanning 48 by 55 pixels then Places a orange circle of radius 53 at center (393, 145).
; PLAN: r0=224(x), r1=162(y), r2=48(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x), r6=145(y), r7=53(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 224
LDI r1, 162
LDI r2, 48
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 145
LDI r7, 53
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
