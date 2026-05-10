; DESCRIPTION: Composite: Creates a blue circular shape at (353, 82) with radius 36 then Places a yellow dot at position (275, 116) then Places a green 22x33 rectangle at position (382, 4).
; PLAN: r0=353(x), r1=82(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x), r6=116(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=382(x), r11=4(y), r12=22(width), r13=33(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 82
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 116
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 382
LDI r11, 4
LDI r12, 22
LDI r13, 33
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
