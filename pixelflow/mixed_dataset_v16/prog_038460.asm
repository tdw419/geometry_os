; DESCRIPTION: Composite: Creates a green circular shape at (218, 41) with radius 10 then Creates a magenta rectangular region at (79, 174) spanning 31 by 72 pixels.
; PLAN: r0=218(x), r1=41(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=174(y), r7=31(width), r8=72(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 41
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 174
LDI r7, 31
LDI r8, 72
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
