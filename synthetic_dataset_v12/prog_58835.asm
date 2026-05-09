; DESCRIPTION: Composite: Places a black dot at position (356, 206) then Draws a yellow circle centered at (300, 188) with radius 19 then Places a white 82x21 rectangle at position (249, 168).
; PLAN: r0=356(x), r1=206(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=188(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=249(x), r11=168(y), r12=82(width), r13=21(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 206
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 300
LDI r6, 188
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 249
LDI r11, 168
LDI r12, 82
LDI r13, 21
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
