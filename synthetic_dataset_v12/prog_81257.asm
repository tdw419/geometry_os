; DESCRIPTION: Composite: Renders a cyan box of size 114x83 starting at (56, 71) then Draws a purple circle centered at (146, 110) with radius 37.
; PLAN: r0=56(x), r1=71(y), r2=114(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=146(x), r6=110(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 56
LDI r1, 71
LDI r2, 114
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 110
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
