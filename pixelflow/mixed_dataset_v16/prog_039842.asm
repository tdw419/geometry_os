; DESCRIPTION: Composite: Draws a green circle centered at (163, 168) with radius 27 then Places a magenta dot at position (272, 62) then Renders a orange box of size 52x38 starting at (217, 52).
; PLAN: r0=163(x), r1=168(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=62(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=217(x), r11=52(y), r12=52(width), r13=38(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 168
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 62
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 217
LDI r11, 52
LDI r12, 52
LDI r13, 38
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
