; DESCRIPTION: Composite: Creates a green circular shape at (255, 176) with radius 15 then Places a purple dot at position (18, 129) then Renders a red line between points (96, 252) and (144, 153).
; PLAN: r0=255(x), r1=176(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x), r6=129(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=96(x1), r11=252(y1), r12=144(x2), r13=153(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 176
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 129
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 96
LDI r11, 252
LDI r12, 144
LDI r13, 153
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
