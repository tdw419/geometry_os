; DESCRIPTION: Composite: Renders a yellow box of size 71x71 starting at (235, 91) then Sets a single orange pixel at (408, 235) then Places a yellow circle of radius 70 at center (160, 132).
; PLAN: r0=235(x), r1=91(y), r2=71(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=235(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=160(x), r11=132(y), r12=70(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 235
LDI r1, 91
LDI r2, 71
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 235
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 160
LDI r11, 132
LDI r12, 70
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
