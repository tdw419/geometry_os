; DESCRIPTION: Composite: Sets a single white pixel at (210, 225) then Draws a cyan rectangle at (294, 122) with width 100 and height 78 then Draws a black line from (31, 56) to (132, 154).
; PLAN: r0=210(x), r1=225(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=294(x), r6=122(y), r7=100(width), r8=78(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=31(x1), r11=56(y1), r12=132(x2), r13=154(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 225
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 294
LDI r6, 122
LDI r7, 100
LDI r8, 78
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 56
LDI r12, 132
LDI r13, 154
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
