; DESCRIPTION: Composite: Draws a orange circle centered at (352, 69) with radius 27 then Creates a orange rectangular region at (229, 51) spanning 115 by 11 pixels.
; PLAN: r0=352(x), r1=69(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=51(y), r7=115(width), r8=11(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 69
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 51
LDI r7, 115
LDI r8, 11
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
