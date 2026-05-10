; DESCRIPTION: Composite: Places a cyan dot at position (240, 90) then Places a yellow 18x72 rectangle at position (169, 43) then Draws a cyan line from (469, 15) to (114, 79).
; PLAN: r0=240(x), r1=90(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=43(y), r7=18(width), r8=72(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=469(x1), r11=15(y1), r12=114(x2), r13=79(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 90
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 169
LDI r6, 43
LDI r7, 18
LDI r8, 72
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 15
LDI r12, 114
LDI r13, 79
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
