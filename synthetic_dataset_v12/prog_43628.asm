; DESCRIPTION: Composite: Places a yellow line segment connecting (491, 236) to (283, 170) then Renders a red box of size 105x10 starting at (148, 239).
; PLAN: r0=491(x1), r1=236(y1), r2=283(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=239(y), r7=105(width), r8=10(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 491
LDI r1, 236
LDI r2, 283
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 239
LDI r7, 105
LDI r8, 10
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
