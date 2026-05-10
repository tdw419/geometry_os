; DESCRIPTION: Composite: Places a white line segment connecting (174, 173) to (284, 64) then Places a cyan dot at position (57, 62) then Draws a black rectangle at (298, 39) with width 78 and height 81.
; PLAN: r0=174(x1), r1=173(y1), r2=284(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=62(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=298(x), r11=39(y), r12=78(width), r13=81(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 173
LDI r2, 284
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 62
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 298
LDI r11, 39
LDI r12, 78
LDI r13, 81
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
