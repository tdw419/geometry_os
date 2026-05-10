; DESCRIPTION: Composite: Sets a single yellow pixel at (264, 253) then Draws a white rectangle at (197, 133) with width 107 and height 60 then Renders a red disk with center (451, 61) and radius 32.
; PLAN: r0=264(x), r1=253(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=197(x), r6=133(y), r7=107(width), r8=60(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x), r11=61(y), r12=32(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 253
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 197
LDI r6, 133
LDI r7, 107
LDI r8, 60
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 61
LDI r12, 32
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
