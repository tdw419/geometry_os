; DESCRIPTION: Composite: Sets a single red pixel at (361, 60) then Renders a orange box of size 96x114 starting at (229, 67).
; PLAN: r0=361(x), r1=60(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=229(x), r6=67(y), r7=96(width), r8=114(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 361
LDI r1, 60
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 229
LDI r6, 67
LDI r7, 96
LDI r8, 114
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
