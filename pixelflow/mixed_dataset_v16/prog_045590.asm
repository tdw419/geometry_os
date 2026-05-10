; DESCRIPTION: Composite: Places a green dot at position (484, 37) then Places a red 119x52 rectangle at position (27, 58) then Renders a yellow disk with center (308, 104) and radius 57.
; PLAN: r0=484(x), r1=37(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=27(x), r6=58(y), r7=119(width), r8=52(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=308(x), r11=104(y), r12=57(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 484
LDI r1, 37
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 27
LDI r6, 58
LDI r7, 119
LDI r8, 52
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 104
LDI r12, 57
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
