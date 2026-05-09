; DESCRIPTION: Composite: Places a purple dot at position (106, 59) then Draws a white line from (242, 22) to (338, 108) then Draws a white rectangle at (168, 62) with width 33 and height 94.
; PLAN: r0=106(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=242(x1), r6=22(y1), r7=338(x2), r8=108(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=168(x), r11=62(y), r12=33(width), r13=94(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 59
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 22
LDI r7, 338
LDI r8, 108
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 62
LDI r12, 33
LDI r13, 94
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
