; DESCRIPTION: Composite: Places a orange circle of radius 41 at center (447, 150) then Creates a purple rectangular region at (317, 194) spanning 119 by 46 pixels.
; PLAN: r0=447(x), r1=150(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x), r6=194(y), r7=119(width), r8=46(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 150
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 194
LDI r7, 119
LDI r8, 46
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
