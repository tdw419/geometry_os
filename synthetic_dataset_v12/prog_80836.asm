; DESCRIPTION: Composite: Draws a blue circle centered at (304, 111) with radius 27 then Sets a single black pixel at (494, 54) then Renders a black line between points (353, 59) and (156, 154).
; PLAN: r0=304(x), r1=111(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x), r6=54(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=353(x1), r11=59(y1), r12=156(x2), r13=154(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 111
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 54
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 353
LDI r11, 59
LDI r12, 156
LDI r13, 154
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
