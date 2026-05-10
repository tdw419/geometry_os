; DESCRIPTION: Composite: Renders a green box of size 11x109 starting at (213, 103) then Draws a green circle centered at (66, 73) with radius 38.
; PLAN: r0=213(x), r1=103(y), r2=11(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=73(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 213
LDI r1, 103
LDI r2, 11
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 73
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
