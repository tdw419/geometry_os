; DESCRIPTION: Composite: Sets a single yellow pixel at (369, 162) then Renders a orange box of size 77x87 starting at (421, 26).
; PLAN: r0=369(x), r1=162(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=421(x), r6=26(y), r7=77(width), r8=87(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 162
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 421
LDI r6, 26
LDI r7, 77
LDI r8, 87
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
