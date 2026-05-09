; DESCRIPTION: Composite: Places a magenta dot at position (343, 167) then Renders a yellow line between points (37, 142) and (478, 103) then Renders a black box of size 116x24 starting at (178, 204).
; PLAN: r0=343(x), r1=167(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=37(x1), r6=142(y1), r7=478(x2), r8=103(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=178(x), r11=204(y), r12=116(width), r13=24(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 343
LDI r1, 167
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 37
LDI r6, 142
LDI r7, 478
LDI r8, 103
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 204
LDI r12, 116
LDI r13, 24
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
