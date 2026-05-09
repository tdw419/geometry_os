; DESCRIPTION: Composite: Renders a yellow disk with center (392, 182) and radius 27 then Draws a black rectangle at (68, 87) with width 96 and height 72.
; PLAN: r0=392(x), r1=182(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=87(y), r7=96(width), r8=72(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 182
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 87
LDI r7, 96
LDI r8, 72
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
