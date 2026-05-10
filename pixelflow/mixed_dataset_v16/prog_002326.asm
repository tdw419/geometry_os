; DESCRIPTION: Composite: Draws a purple rectangle at (224, 142) with width 69 and height 22 then Sets a single green pixel at (198, 115).
; PLAN: r0=224(x), r1=142(y), r2=69(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=115(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 224
LDI r1, 142
LDI r2, 69
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 115
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
