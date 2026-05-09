; DESCRIPTION: Composite: Places a green dot at position (245, 179) then Draws a white rectangle at (332, 104) with width 58 and height 113 then Draws a red circle centered at (346, 80) with radius 71.
; PLAN: r0=245(x), r1=179(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=104(y), r7=58(width), r8=113(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x), r11=80(y), r12=71(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 179
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 332
LDI r6, 104
LDI r7, 58
LDI r8, 113
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 80
LDI r12, 71
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
