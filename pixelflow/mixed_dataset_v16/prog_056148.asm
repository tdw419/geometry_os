; DESCRIPTION: Composite: Places a yellow dot at position (150, 243) then Draws a red circle centered at (163, 151) with radius 64 then Renders a white box of size 68x98 starting at (380, 4).
; PLAN: r0=150(x), r1=243(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=151(y), r7=64(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x), r11=4(y), r12=68(width), r13=98(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 243
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 163
LDI r6, 151
LDI r7, 64
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 4
LDI r12, 68
LDI r13, 98
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
