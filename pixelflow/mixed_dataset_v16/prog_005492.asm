; DESCRIPTION: Composite: Places a purple 41x44 rectangle at position (259, 107) then Places a orange dot at position (135, 47) then Renders a green disk with center (420, 118) and radius 67.
; PLAN: r0=259(x), r1=107(y), r2=41(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=135(x), r6=47(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=420(x), r11=118(y), r12=67(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 107
LDI r2, 41
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 47
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 420
LDI r11, 118
LDI r12, 67
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
