; DESCRIPTION: Composite: Places a black line segment connecting (473, 238) to (426, 94) then Sets a single magenta pixel at (60, 118) then Draws a red rectangle at (213, 48) with width 70 and height 120.
; PLAN: r0=473(x1), r1=238(y1), r2=426(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=118(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=213(x), r11=48(y), r12=70(width), r13=120(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 238
LDI r2, 426
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 118
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 213
LDI r11, 48
LDI r12, 70
LDI r13, 120
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
