; DESCRIPTION: Composite: Renders a magenta box of size 84x90 starting at (116, 118) then Creates a magenta circular shape at (419, 160) with radius 40.
; PLAN: r0=116(x), r1=118(y), r2=84(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x), r6=160(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 116
LDI r1, 118
LDI r2, 84
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 160
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
