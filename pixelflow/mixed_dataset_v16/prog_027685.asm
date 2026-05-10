; DESCRIPTION: Composite: Places a blue dot at position (50, 229) then Renders a orange box of size 79x50 starting at (345, 49) then Creates a red circular shape at (67, 122) with radius 58.
; PLAN: r0=50(x), r1=229(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=49(y), r7=79(width), r8=50(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=67(x), r11=122(y), r12=58(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 50
LDI r1, 229
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 49
LDI r7, 79
LDI r8, 50
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 122
LDI r12, 58
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
