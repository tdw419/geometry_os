; DESCRIPTION: Composite: Draws a purple rectangle at (361, 24) with width 117 and height 86 then Creates a cyan circular shape at (82, 90) with radius 59.
; PLAN: r0=361(x), r1=24(y), r2=117(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x), r6=90(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 361
LDI r1, 24
LDI r2, 117
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 90
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
