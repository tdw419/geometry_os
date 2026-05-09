; DESCRIPTION: Composite: Draws a red rectangle at (401, 86) with width 23 and height 104 then Draws a orange circle centered at (393, 159) with radius 18.
; PLAN: r0=401(x), r1=86(y), r2=23(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x), r6=159(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 401
LDI r1, 86
LDI r2, 23
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 159
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
