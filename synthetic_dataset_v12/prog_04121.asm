; DESCRIPTION: Composite: Places a cyan circle of radius 15 at center (229, 141) then Places a cyan dot at position (465, 57) then Draws a yellow rectangle at (173, 57) with width 87 and height 47.
; PLAN: r0=229(x), r1=141(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x), r6=57(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=173(x), r11=57(y), r12=87(width), r13=47(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 141
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 57
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 173
LDI r11, 57
LDI r12, 87
LDI r13, 47
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
