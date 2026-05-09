; DESCRIPTION: Composite: Renders a green disk with center (188, 170) and radius 66 then Places a red 83x98 rectangle at position (46, 82) then Renders a black line between points (352, 73) and (68, 148).
; PLAN: r0=188(x), r1=170(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=82(y), r7=83(width), r8=98(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=352(x1), r11=73(y1), r12=68(x2), r13=148(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 170
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 82
LDI r7, 83
LDI r8, 98
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 73
LDI r12, 68
LDI r13, 148
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
