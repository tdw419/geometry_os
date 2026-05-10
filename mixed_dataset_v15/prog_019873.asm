; DESCRIPTION: Composite: Creates a magenta circular shape at (213, 149) with radius 11 then Draws a purple rectangle at (464, 82) with width 44 and height 73.
; PLAN: r0=213(x), r1=149(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=464(x), r6=82(y), r7=44(width), r8=73(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 149
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 464
LDI r6, 82
LDI r7, 44
LDI r8, 73
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
