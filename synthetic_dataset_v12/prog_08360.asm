; DESCRIPTION: Composite: Renders a green box of size 14x99 starting at (73, 34) then Creates a yellow circular shape at (372, 48) with radius 18 then Places a yellow dot at position (331, 235).
; PLAN: r0=73(x), r1=34(y), r2=14(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x), r6=48(y), r7=18(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=331(x), r11=235(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 73
LDI r1, 34
LDI r2, 14
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 48
LDI r7, 18
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 331
LDI r11, 235
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
