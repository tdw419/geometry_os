; DESCRIPTION: Renders a magenta rectangular region spanning 25 by 45 at (348, 96).
; PLAN: r0=348(x), r1=96(y), r2=25(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 96
LDI r2, 25
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
