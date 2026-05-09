; DESCRIPTION: Composite: Renders a red box of size 54x49 starting at (142, 207) then Places a cyan dot at position (203, 159) then Renders a yellow line between points (65, 122) and (475, 51).
; PLAN: r0=142(x), r1=207(y), r2=54(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x), r6=159(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=65(x1), r11=122(y1), r12=475(x2), r13=51(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 207
LDI r2, 54
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 159
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 65
LDI r11, 122
LDI r12, 475
LDI r13, 51
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
