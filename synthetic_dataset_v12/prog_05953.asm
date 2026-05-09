; DESCRIPTION: Composite: Places a white circle of radius 42 at center (145, 199) then Renders a red box of size 42x96 starting at (465, 87).
; PLAN: r0=145(x), r1=199(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x), r6=87(y), r7=42(width), r8=96(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 199
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 87
LDI r7, 42
LDI r8, 96
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
