; DESCRIPTION: Composite: Places a magenta circle of radius 56 at center (324, 90) then Renders a magenta box of size 116x22 starting at (203, 58).
; PLAN: r0=324(x), r1=90(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=203(x), r6=58(y), r7=116(width), r8=22(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 90
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 203
LDI r6, 58
LDI r7, 116
LDI r8, 22
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
