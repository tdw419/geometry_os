; DESCRIPTION: Composite: Draws a cyan rectangle at (22, 105) with width 89 and height 120 then Renders a cyan disk with center (59, 46) and radius 43 then Draws a white line from (508, 71) to (44, 8).
; PLAN: r0=22(x), r1=105(y), r2=89(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x), r6=46(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=508(x1), r11=71(y1), r12=44(x2), r13=8(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 22
LDI r1, 105
LDI r2, 89
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 46
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 508
LDI r11, 71
LDI r12, 44
LDI r13, 8
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
