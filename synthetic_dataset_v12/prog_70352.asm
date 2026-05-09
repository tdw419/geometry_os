; DESCRIPTION: Composite: Places a white 30x56 rectangle at position (482, 14) then Renders a black disk with center (470, 41) and radius 17 then Draws a yellow line from (235, 218) to (370, 124).
; PLAN: r0=482(x), r1=14(y), r2=30(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x), r6=41(y), r7=17(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x1), r11=218(y1), r12=370(x2), r13=124(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 482
LDI r1, 14
LDI r2, 30
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 41
LDI r7, 17
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 218
LDI r12, 370
LDI r13, 124
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
