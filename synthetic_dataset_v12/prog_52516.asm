; DESCRIPTION: Renders a blue box of size 77x75 starting at (285, 143).
; PLAN: r0=285(x), r1=143(y), r2=77(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 143
LDI r2, 77
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
