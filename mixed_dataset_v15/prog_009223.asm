; DESCRIPTION: Composite: Draws a red rectangle at (127, 203) with width 26 and height 36 then Places a yellow dot at position (218, 11) then Renders a purple disk with center (422, 166) and radius 11.
; PLAN: r0=127(x), r1=203(y), r2=26(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=11(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=422(x), r11=166(y), r12=11(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 127
LDI r1, 203
LDI r2, 26
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 11
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 422
LDI r11, 166
LDI r12, 11
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
