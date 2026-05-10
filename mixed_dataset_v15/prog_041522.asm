; DESCRIPTION: Composite: Draws a green circle centered at (271, 196) with radius 50 then Creates a cyan rectangular region at (288, 110) spanning 86 by 14 pixels.
; PLAN: r0=271(x), r1=196(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x), r6=110(y), r7=86(width), r8=14(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 196
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 110
LDI r7, 86
LDI r8, 14
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
