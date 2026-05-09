; DESCRIPTION: Composite: Renders a orange box of size 107x48 starting at (295, 149) then Draws a blue circle centered at (379, 134) with radius 54.
; PLAN: r0=295(x), r1=149(y), r2=107(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x), r6=134(y), r7=54(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 295
LDI r1, 149
LDI r2, 107
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 134
LDI r7, 54
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
