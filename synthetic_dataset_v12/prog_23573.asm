; DESCRIPTION: Composite: Places a yellow dot at position (207, 133) then Renders a white disk with center (451, 192) and radius 22 then Creates a yellow rectangular region at (380, 44) spanning 107 by 41 pixels.
; PLAN: r0=207(x), r1=133(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=451(x), r6=192(y), r7=22(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x), r11=44(y), r12=107(width), r13=41(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 133
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 451
LDI r6, 192
LDI r7, 22
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 44
LDI r12, 107
LDI r13, 41
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
