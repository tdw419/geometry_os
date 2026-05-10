; DESCRIPTION: Composite: Places a yellow dot at position (88, 25) then Renders a orange disk with center (161, 87) and radius 72 then Renders a green line between points (390, 42) and (252, 27).
; PLAN: r0=88(x), r1=25(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=161(x), r6=87(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=390(x1), r11=42(y1), r12=252(x2), r13=27(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 25
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 161
LDI r6, 87
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 390
LDI r11, 42
LDI r12, 252
LDI r13, 27
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
