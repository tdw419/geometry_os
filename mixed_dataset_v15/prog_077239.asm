; DESCRIPTION: Composite: Sets a single red pixel at (88, 227) then Renders a red box of size 27x93 starting at (432, 7).
; PLAN: r0=88(x), r1=227(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=7(y), r7=27(width), r8=93(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 227
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 432
LDI r6, 7
LDI r7, 27
LDI r8, 93
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
