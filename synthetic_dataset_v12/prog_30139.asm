; DESCRIPTION: Composite: Sets a single cyan pixel at (329, 238) then Draws a magenta circle centered at (453, 120) with radius 30 then Creates a cyan rectangular region at (235, 147) spanning 64 by 18 pixels.
; PLAN: r0=329(x), r1=238(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=453(x), r6=120(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x), r11=147(y), r12=64(width), r13=18(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 238
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 453
LDI r6, 120
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 147
LDI r12, 64
LDI r13, 18
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
