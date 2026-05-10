; DESCRIPTION: Composite: Creates a red rectangular region at (45, 211) spanning 46 by 35 pixels then Draws a green circle centered at (400, 79) with radius 40.
; PLAN: r0=45(x), r1=211(y), r2=46(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=79(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 45
LDI r1, 211
LDI r2, 46
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 79
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
