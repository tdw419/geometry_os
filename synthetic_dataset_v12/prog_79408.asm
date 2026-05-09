; DESCRIPTION: Composite: Places a black line segment connecting (329, 241) to (69, 93) then Sets a single blue pixel at (418, 252) then Renders a orange box of size 71x38 starting at (243, 34).
; PLAN: r0=329(x1), r1=241(y1), r2=69(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=252(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=243(x), r11=34(y), r12=71(width), r13=38(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 241
LDI r2, 69
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 252
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 243
LDI r11, 34
LDI r12, 71
LDI r13, 38
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
