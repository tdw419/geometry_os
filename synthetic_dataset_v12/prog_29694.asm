; DESCRIPTION: Composite: Places a red dot at position (411, 112) then Renders a red box of size 55x106 starting at (447, 123).
; PLAN: r0=411(x), r1=112(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=447(x), r6=123(y), r7=55(width), r8=106(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 112
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 447
LDI r6, 123
LDI r7, 55
LDI r8, 106
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
