; DESCRIPTION: Composite: Places a white dot at position (502, 147) then Renders a white line between points (116, 38) and (114, 159) then Draws a cyan rectangle at (56, 14) with width 50 and height 35.
; PLAN: r0=502(x), r1=147(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=116(x1), r6=38(y1), r7=114(x2), r8=159(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=56(x), r11=14(y), r12=50(width), r13=35(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 502
LDI r1, 147
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 116
LDI r6, 38
LDI r7, 114
LDI r8, 159
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 14
LDI r12, 50
LDI r13, 35
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
