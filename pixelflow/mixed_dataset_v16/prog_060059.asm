; DESCRIPTION: Composite: Creates a green rectangular region at (400, 224) spanning 70 by 31 pixels then Places a purple dot at position (369, 209).
; PLAN: r0=400(x), r1=224(y), r2=70(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=369(x), r6=209(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 400
LDI r1, 224
LDI r2, 70
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 209
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
