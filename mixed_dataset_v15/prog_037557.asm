; DESCRIPTION: Renders a white rectangular region spanning 106 by 80 at (318, 151).
; PLAN: r0=318(x), r1=151(y), r2=106(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 151
LDI r2, 106
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
