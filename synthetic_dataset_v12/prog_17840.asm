; DESCRIPTION: Composite: Places a purple dot at position (370, 99) then Renders a yellow line between points (488, 39) and (37, 118) then Renders a red box of size 73x59 starting at (326, 88).
; PLAN: r0=370(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=488(x1), r6=39(y1), r7=37(x2), r8=118(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=326(x), r11=88(y), r12=73(width), r13=59(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 99
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 488
LDI r6, 39
LDI r7, 37
LDI r8, 118
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 88
LDI r12, 73
LDI r13, 59
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
