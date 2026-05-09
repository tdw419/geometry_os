; DESCRIPTION: Composite: Places a magenta dot at position (13, 27) then Renders a black disk with center (351, 93) and radius 10 then Renders a orange line between points (144, 121) and (240, 98).
; PLAN: r0=13(x), r1=27(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=93(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=144(x1), r11=121(y1), r12=240(x2), r13=98(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 27
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 351
LDI r6, 93
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 144
LDI r11, 121
LDI r12, 240
LDI r13, 98
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
