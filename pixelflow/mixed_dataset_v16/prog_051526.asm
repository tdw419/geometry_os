; DESCRIPTION: Composite: Draws a white rectangle at (352, 117) with width 73 and height 21 then Places a white dot at position (423, 161).
; PLAN: r0=352(x), r1=117(y), r2=73(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=161(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 117
LDI r2, 73
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 161
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
