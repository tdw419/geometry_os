; DESCRIPTION: Composite: Draws a green rectangle at (460, 98) with width 27 and height 79 then Renders a yellow disk with center (340, 190) and radius 63.
; PLAN: r0=460(x), r1=98(y), r2=27(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=340(x), r6=190(y), r7=63(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 460
LDI r1, 98
LDI r2, 27
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 190
LDI r7, 63
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
