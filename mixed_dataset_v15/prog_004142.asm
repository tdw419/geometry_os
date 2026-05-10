; DESCRIPTION: Composite: Places a cyan circle of radius 65 at center (136, 99) then Draws a white rectangle at (346, 98) with width 23 and height 94 then Draws a black line from (46, 18) to (361, 25).
; PLAN: r0=136(x), r1=99(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=98(y), r7=23(width), r8=94(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=46(x1), r11=18(y1), r12=361(x2), r13=25(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 99
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 98
LDI r7, 23
LDI r8, 94
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 18
LDI r12, 361
LDI r13, 25
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
