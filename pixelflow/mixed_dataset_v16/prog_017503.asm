; DESCRIPTION: Composite: Places a white dot at position (139, 55) then Places a cyan circle of radius 29 at center (328, 56) then Draws a green line from (236, 200) to (368, 88).
; PLAN: r0=139(x), r1=55(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=56(y), r7=29(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=236(x1), r11=200(y1), r12=368(x2), r13=88(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 55
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 328
LDI r6, 56
LDI r7, 29
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 236
LDI r11, 200
LDI r12, 368
LDI r13, 88
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
