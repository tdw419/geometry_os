; DESCRIPTION: Composite: Sets a single yellow pixel at (308, 148) then Draws a orange rectangle at (53, 61) with width 94 and height 53.
; PLAN: r0=308(x), r1=148(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=61(y), r7=94(width), r8=53(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 148
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 53
LDI r6, 61
LDI r7, 94
LDI r8, 53
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
