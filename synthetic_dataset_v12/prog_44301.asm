; DESCRIPTION: Composite: Places a yellow dot at position (179, 47) then Renders a black box of size 18x67 starting at (259, 189) then Renders a red line between points (475, 226) and (411, 225).
; PLAN: r0=179(x), r1=47(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=189(y), r7=18(width), r8=67(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=475(x1), r11=226(y1), r12=411(x2), r13=225(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 47
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 259
LDI r6, 189
LDI r7, 18
LDI r8, 67
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 475
LDI r11, 226
LDI r12, 411
LDI r13, 225
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
