; DESCRIPTION: Composite: Creates a blue rectangular region at (35, 175) spanning 38 by 39 pixels then Renders a orange disk with center (392, 125) and radius 41.
; PLAN: r0=35(x), r1=175(y), r2=38(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=125(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 35
LDI r1, 175
LDI r2, 38
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 125
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
