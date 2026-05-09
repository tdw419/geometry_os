; DESCRIPTION: Composite: Draws a red line from (289, 160) to (409, 123) then Places a red 102x119 rectangle at position (291, 119).
; PLAN: r0=289(x1), r1=160(y1), r2=409(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=119(y), r7=102(width), r8=119(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 160
LDI r2, 409
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 119
LDI r7, 102
LDI r8, 119
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
