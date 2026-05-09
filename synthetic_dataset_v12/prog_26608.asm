; DESCRIPTION: Composite: Draws a white rectangle at (283, 67) with width 73 and height 78 then Draws a green circle centered at (231, 117) with radius 65 then Places a orange dot at position (404, 204).
; PLAN: r0=283(x), r1=67(y), r2=73(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=117(y), r7=65(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=404(x), r11=204(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 283
LDI r1, 67
LDI r2, 73
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 117
LDI r7, 65
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 404
LDI r11, 204
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
