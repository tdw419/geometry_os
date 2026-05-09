; DESCRIPTION: Composite: Creates a orange circular shape at (284, 48) with radius 47 then Creates a yellow rectangular region at (185, 11) spanning 60 by 70 pixels.
; PLAN: r0=284(x), r1=48(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x), r6=11(y), r7=60(width), r8=70(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 48
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 11
LDI r7, 60
LDI r8, 70
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
