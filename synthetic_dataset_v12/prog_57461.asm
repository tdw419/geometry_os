; DESCRIPTION: Composite: Renders a green box of size 90x68 starting at (138, 148) then Draws a yellow circle centered at (283, 127) with radius 70.
; PLAN: r0=138(x), r1=148(y), r2=90(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x), r6=127(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 148
LDI r2, 90
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 127
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
