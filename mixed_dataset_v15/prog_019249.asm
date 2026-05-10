; DESCRIPTION: Composite: Sets a single cyan pixel at (72, 172) then Creates a green circular shape at (175, 72) with radius 49 then Renders a cyan box of size 60x53 starting at (120, 108).
; PLAN: r0=72(x), r1=172(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=72(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x), r11=108(y), r12=60(width), r13=53(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 172
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 175
LDI r6, 72
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 108
LDI r12, 60
LDI r13, 53
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
