; DESCRIPTION: Composite: Renders a white disk with center (43, 54) and radius 29 then Renders a purple box of size 89x104 starting at (83, 59) then Draws a cyan line from (50, 18) to (174, 98).
; PLAN: r0=43(x), r1=54(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=59(y), r7=89(width), r8=104(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=50(x1), r11=18(y1), r12=174(x2), r13=98(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 54
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 59
LDI r7, 89
LDI r8, 104
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 18
LDI r12, 174
LDI r13, 98
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
