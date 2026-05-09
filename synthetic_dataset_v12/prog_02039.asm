; DESCRIPTION: Composite: Creates a purple rectangular region at (397, 10) spanning 65 by 56 pixels then Places a blue circle of radius 56 at center (350, 63).
; PLAN: r0=397(x), r1=10(y), r2=65(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x), r6=63(y), r7=56(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 397
LDI r1, 10
LDI r2, 65
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 63
LDI r7, 56
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
