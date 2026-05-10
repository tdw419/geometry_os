; DESCRIPTION: Composite: Places a yellow 83x32 rectangle at position (373, 67) then Places a black dot at position (466, 248) then Renders a purple line between points (109, 166) and (425, 30).
; PLAN: r0=373(x), r1=67(y), r2=83(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=466(x), r6=248(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=109(x1), r11=166(y1), r12=425(x2), r13=30(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 67
LDI r2, 83
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 248
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 109
LDI r11, 166
LDI r12, 425
LDI r13, 30
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
