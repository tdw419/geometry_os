; DESCRIPTION: Composite: Places a red dot at position (484, 204) then Draws a green rectangle at (299, 56) with width 51 and height 119 then Places a white line segment connecting (365, 192) to (352, 15).
; PLAN: r0=484(x), r1=204(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=56(y), r7=51(width), r8=119(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x1), r11=192(y1), r12=352(x2), r13=15(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 204
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 299
LDI r6, 56
LDI r7, 51
LDI r8, 119
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 192
LDI r12, 352
LDI r13, 15
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
