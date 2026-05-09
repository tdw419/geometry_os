; DESCRIPTION: Composite: Renders a magenta box of size 99x120 starting at (231, 61) then Renders a magenta disk with center (348, 101) and radius 77.
; PLAN: r0=231(x), r1=61(y), r2=99(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=101(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 231
LDI r1, 61
LDI r2, 99
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 101
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
