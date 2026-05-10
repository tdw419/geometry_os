; DESCRIPTION: Composite: Draws a purple circle centered at (473, 127) with radius 34 then Renders a orange box of size 33x68 starting at (353, 152).
; PLAN: r0=473(x), r1=127(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=152(y), r7=33(width), r8=68(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 127
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 152
LDI r7, 33
LDI r8, 68
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
