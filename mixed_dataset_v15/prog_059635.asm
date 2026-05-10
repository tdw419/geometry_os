; DESCRIPTION: Composite: Draws a red rectangle at (70, 28) with width 46 and height 48 then Places a purple line segment connecting (86, 40) to (276, 152).
; PLAN: r0=70(x), r1=28(y), r2=46(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x1), r6=40(y1), r7=276(x2), r8=152(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 28
LDI r2, 46
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 40
LDI r7, 276
LDI r8, 152
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
