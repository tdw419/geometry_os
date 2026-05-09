; DESCRIPTION: Composite: Draws a orange rectangle at (401, 130) with width 16 and height 103 then Places a orange dot at position (400, 44) then Creates a orange circular shape at (384, 172) with radius 75.
; PLAN: r0=401(x), r1=130(y), r2=16(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=44(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=384(x), r11=172(y), r12=75(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 401
LDI r1, 130
LDI r2, 16
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 44
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 384
LDI r11, 172
LDI r12, 75
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
