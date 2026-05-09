; DESCRIPTION: Renders a white box of size 10x94 starting at (348, 79).
; PLAN: r0=348(x), r1=79(y), r2=10(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 79
LDI r2, 10
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
