; DESCRIPTION: Composite: Draws a red circle centered at (176, 149) with radius 55 then Creates a green rectangular region at (401, 73) spanning 45 by 118 pixels.
; PLAN: r0=176(x), r1=149(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=73(y), r7=45(width), r8=118(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 149
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 73
LDI r7, 45
LDI r8, 118
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
