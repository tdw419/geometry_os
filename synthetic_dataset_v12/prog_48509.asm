; DESCRIPTION: Composite: Draws a green line from (188, 78) to (411, 127) then Places a white dot at position (174, 103) then Places a blue 48x104 rectangle at position (407, 131).
; PLAN: r0=188(x1), r1=78(y1), r2=411(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=103(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=407(x), r11=131(y), r12=48(width), r13=104(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 78
LDI r2, 411
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 103
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 407
LDI r11, 131
LDI r12, 48
LDI r13, 104
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
