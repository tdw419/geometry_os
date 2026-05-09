; DESCRIPTION: Composite: Creates a orange rectangular region at (356, 178) spanning 15 by 34 pixels then Places a yellow line segment connecting (449, 64) to (11, 193).
; PLAN: r0=356(x), r1=178(y), r2=15(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x1), r6=64(y1), r7=11(x2), r8=193(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 178
LDI r2, 15
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 64
LDI r7, 11
LDI r8, 193
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
