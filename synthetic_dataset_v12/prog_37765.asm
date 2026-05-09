; DESCRIPTION: Renders a purple box of size 56x10 starting at (348, 28).
; PLAN: r0=348(x), r1=28(y), r2=56(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 28
LDI r2, 56
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
