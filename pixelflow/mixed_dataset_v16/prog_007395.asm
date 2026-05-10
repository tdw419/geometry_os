; DESCRIPTION: Composite: Renders a green line between points (475, 231) and (453, 62) then Places a black dot at position (493, 83) then Places a orange 95x25 rectangle at position (388, 116).
; PLAN: r0=475(x1), r1=231(y1), r2=453(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=493(x), r6=83(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=388(x), r11=116(y), r12=95(width), r13=25(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 475
LDI r1, 231
LDI r2, 453
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 493
LDI r6, 83
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 388
LDI r11, 116
LDI r12, 95
LDI r13, 25
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
