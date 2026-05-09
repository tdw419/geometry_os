; DESCRIPTION: Composite: Sets a single yellow pixel at (294, 93) then Draws a red circle centered at (195, 204) with radius 13 then Draws a orange rectangle at (296, 151) with width 34 and height 62.
; PLAN: r0=294(x), r1=93(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=204(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=296(x), r11=151(y), r12=34(width), r13=62(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 93
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 195
LDI r6, 204
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 296
LDI r11, 151
LDI r12, 34
LDI r13, 62
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
