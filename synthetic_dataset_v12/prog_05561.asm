; DESCRIPTION: Composite: Places a magenta 27x52 rectangle at position (407, 45) then Places a magenta line segment connecting (419, 205) to (92, 33) then Creates a orange circular shape at (341, 157) with radius 25.
; PLAN: r0=407(x), r1=45(y), r2=27(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x1), r6=205(y1), r7=92(x2), r8=33(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=157(y), r12=25(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 407
LDI r1, 45
LDI r2, 27
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 205
LDI r7, 92
LDI r8, 33
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 157
LDI r12, 25
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
