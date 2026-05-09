; DESCRIPTION: Composite: Draws a black circle centered at (221, 86) with radius 72 then Draws a magenta rectangle at (330, 197) with width 62 and height 57.
; PLAN: r0=221(x), r1=86(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x), r6=197(y), r7=62(width), r8=57(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 86
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 197
LDI r7, 62
LDI r8, 57
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
