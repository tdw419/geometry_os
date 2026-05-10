; DESCRIPTION: Composite: Places a red dot at position (7, 101) then Draws a black line from (488, 195) to (305, 240) then Places a red circle of radius 29 at center (137, 61).
; PLAN: r0=7(x), r1=101(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=488(x1), r6=195(y1), r7=305(x2), r8=240(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=61(y), r12=29(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 7
LDI r1, 101
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 488
LDI r6, 195
LDI r7, 305
LDI r8, 240
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 61
LDI r12, 29
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
