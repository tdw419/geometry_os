; DESCRIPTION: Composite: Renders a red box of size 42x115 starting at (413, 51) then Draws a white circle centered at (266, 102) with radius 47.
; PLAN: r0=413(x), r1=51(y), r2=42(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=102(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 413
LDI r1, 51
LDI r2, 42
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 102
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
