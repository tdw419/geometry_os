; DESCRIPTION: Composite: Places a red dot at position (471, 241) then Renders a yellow box of size 19x69 starting at (352, 161).
; PLAN: r0=471(x), r1=241(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=161(y), r7=19(width), r8=69(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 241
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 352
LDI r6, 161
LDI r7, 19
LDI r8, 69
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
