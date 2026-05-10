; DESCRIPTION: Composite: Renders a yellow box of size 84x15 starting at (203, 213) then Draws a black circle centered at (146, 155) with radius 57.
; PLAN: r0=203(x), r1=213(y), r2=84(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=146(x), r6=155(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 203
LDI r1, 213
LDI r2, 84
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 155
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
