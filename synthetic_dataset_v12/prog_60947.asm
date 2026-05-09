; DESCRIPTION: Composite: Places a black dot at position (487, 227) then Renders a red disk with center (278, 174) and radius 65 then Renders a black box of size 115x53 starting at (89, 50).
; PLAN: r0=487(x), r1=227(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=174(y), r7=65(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=89(x), r11=50(y), r12=115(width), r13=53(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 487
LDI r1, 227
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 278
LDI r6, 174
LDI r7, 65
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 89
LDI r11, 50
LDI r12, 115
LDI r13, 53
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
