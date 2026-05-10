; DESCRIPTION: Composite: Places a black line segment connecting (48, 141) to (151, 251) then Renders a orange box of size 52x31 starting at (324, 18).
; PLAN: r0=48(x1), r1=141(y1), r2=151(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=18(y), r7=52(width), r8=31(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 141
LDI r2, 151
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 18
LDI r7, 52
LDI r8, 31
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
