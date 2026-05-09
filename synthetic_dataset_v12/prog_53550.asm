; DESCRIPTION: Composite: Places a red dot at position (266, 227) then Draws a cyan rectangle at (400, 35) with width 76 and height 105.
; PLAN: r0=266(x), r1=227(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=35(y), r7=76(width), r8=105(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 227
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 400
LDI r6, 35
LDI r7, 76
LDI r8, 105
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
