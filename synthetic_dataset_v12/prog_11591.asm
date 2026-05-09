; DESCRIPTION: Composite: Creates a magenta circular shape at (235, 173) with radius 65 then Places a magenta dot at position (175, 20) then Renders a cyan box of size 118x91 starting at (18, 3).
; PLAN: r0=235(x), r1=173(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x), r6=20(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=18(x), r11=3(y), r12=118(width), r13=91(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 173
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 20
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 18
LDI r11, 3
LDI r12, 118
LDI r13, 91
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
