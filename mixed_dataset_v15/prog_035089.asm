; DESCRIPTION: Composite: Draws a white line from (72, 73) to (389, 48) then Places a red dot at position (298, 73) then Draws a blue rectangle at (424, 124) with width 86 and height 62.
; PLAN: r0=72(x1), r1=73(y1), r2=389(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=73(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=424(x), r11=124(y), r12=86(width), r13=62(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 73
LDI r2, 389
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 73
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 424
LDI r11, 124
LDI r12, 86
LDI r13, 62
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
