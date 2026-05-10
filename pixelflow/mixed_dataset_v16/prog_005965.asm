; DESCRIPTION: Composite: Places a green line segment connecting (189, 145) to (53, 137) then Renders a orange box of size 27x106 starting at (71, 90).
; PLAN: r0=189(x1), r1=145(y1), r2=53(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=90(y), r7=27(width), r8=106(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 145
LDI r2, 53
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 90
LDI r7, 27
LDI r8, 106
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
