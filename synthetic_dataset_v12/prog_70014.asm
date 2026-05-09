; DESCRIPTION: Composite: Sets a single white pixel at (41, 73) then Renders a orange box of size 110x41 starting at (236, 61).
; PLAN: r0=41(x), r1=73(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=61(y), r7=110(width), r8=41(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 73
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 236
LDI r6, 61
LDI r7, 110
LDI r8, 41
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
