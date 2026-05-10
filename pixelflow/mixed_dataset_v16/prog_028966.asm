; DESCRIPTION: Composite: Places a white dot at position (180, 69) then Places a cyan 80x92 rectangle at position (203, 55) then Draws a blue line from (444, 176) to (142, 245).
; PLAN: r0=180(x), r1=69(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=55(y), r7=80(width), r8=92(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=444(x1), r11=176(y1), r12=142(x2), r13=245(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 180
LDI r1, 69
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 203
LDI r6, 55
LDI r7, 80
LDI r8, 92
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 444
LDI r11, 176
LDI r12, 142
LDI r13, 245
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
