; DESCRIPTION: Composite: Draws a white rectangle at (72, 23) with width 41 and height 80 then Sets a single red pixel at (114, 44) then Draws a blue line from (358, 251) to (218, 58).
; PLAN: r0=72(x), r1=23(y), r2=41(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=44(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=358(x1), r11=251(y1), r12=218(x2), r13=58(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 23
LDI r2, 41
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 44
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 358
LDI r11, 251
LDI r12, 218
LDI r13, 58
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
