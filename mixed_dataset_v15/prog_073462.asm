; DESCRIPTION: Composite: Renders a cyan line between points (51, 57) and (324, 116) then Places a cyan dot at position (254, 154) then Draws a cyan rectangle at (356, 152) with width 23 and height 104.
; PLAN: r0=51(x1), r1=57(y1), r2=324(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=154(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=356(x), r11=152(y), r12=23(width), r13=104(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 51
LDI r1, 57
LDI r2, 324
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 154
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 356
LDI r11, 152
LDI r12, 23
LDI r13, 104
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
