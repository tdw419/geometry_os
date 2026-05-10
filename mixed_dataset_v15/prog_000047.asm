; DESCRIPTION: Renders a cyan rectangular region spanning 100 by 119 at (348, 156).
; PLAN: r0=348(x), r1=156(y), r2=100(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 156
LDI r2, 100
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
