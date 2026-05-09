; DESCRIPTION: Composite: Draws a green circle centered at (276, 124) with radius 22 then Renders a white box of size 96x31 starting at (14, 168) then Renders a magenta line between points (499, 121) and (292, 69).
; PLAN: r0=276(x), r1=124(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x), r6=168(y), r7=96(width), r8=31(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=499(x1), r11=121(y1), r12=292(x2), r13=69(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 124
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 168
LDI r7, 96
LDI r8, 31
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 499
LDI r11, 121
LDI r12, 292
LDI r13, 69
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
