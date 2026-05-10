; DESCRIPTION: Composite: Renders a red box of size 64x49 starting at (47, 116) then Sets a single white pixel at (416, 126).
; PLAN: r0=47(x), r1=116(y), r2=64(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=416(x), r6=126(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 47
LDI r1, 116
LDI r2, 64
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 126
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
