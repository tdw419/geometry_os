; DESCRIPTION: Composite: Draws a magenta circle centered at (209, 93) with radius 80 then Places a red dot at position (431, 235) then Renders a blue box of size 26x77 starting at (363, 173).
; PLAN: r0=209(x), r1=93(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=235(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=363(x), r11=173(y), r12=26(width), r13=77(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 93
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 235
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 363
LDI r11, 173
LDI r12, 26
LDI r13, 77
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
