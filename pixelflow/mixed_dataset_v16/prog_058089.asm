; DESCRIPTION: Composite: Sets a single white pixel at (121, 227) then Renders a orange box of size 56x60 starting at (381, 128).
; PLAN: r0=121(x), r1=227(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=128(y), r7=56(width), r8=60(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 227
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 381
LDI r6, 128
LDI r7, 56
LDI r8, 60
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
