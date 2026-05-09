; DESCRIPTION: Composite: Creates a orange circular shape at (428, 165) with radius 35 then Renders a blue box of size 120x108 starting at (367, 62).
; PLAN: r0=428(x), r1=165(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=62(y), r7=120(width), r8=108(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 165
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 62
LDI r7, 120
LDI r8, 108
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
