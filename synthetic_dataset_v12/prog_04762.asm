; DESCRIPTION: Composite: Renders a red box of size 28x47 starting at (25, 103) then Sets a single white pixel at (364, 140).
; PLAN: r0=25(x), r1=103(y), r2=28(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x), r6=140(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 25
LDI r1, 103
LDI r2, 28
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 140
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
