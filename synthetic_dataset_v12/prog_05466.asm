; DESCRIPTION: Composite: Sets a single white pixel at (424, 80) then Renders a red box of size 120x76 starting at (0, 121).
; PLAN: r0=424(x), r1=80(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=0(x), r6=121(y), r7=120(width), r8=76(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 80
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 0
LDI r6, 121
LDI r7, 120
LDI r8, 76
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
