; DESCRIPTION: Composite: Places a yellow dot at position (333, 93) then Draws a purple rectangle at (388, 56) with width 111 and height 44 then Renders a blue disk with center (428, 143) and radius 63.
; PLAN: r0=333(x), r1=93(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=56(y), r7=111(width), r8=44(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=428(x), r11=143(y), r12=63(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 333
LDI r1, 93
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 388
LDI r6, 56
LDI r7, 111
LDI r8, 44
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 143
LDI r12, 63
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
