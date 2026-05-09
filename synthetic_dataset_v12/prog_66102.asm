; DESCRIPTION: Renders a white box of size 24x19 starting at (348, 214).
; PLAN: r0=348(x), r1=214(y), r2=24(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 214
LDI r2, 24
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
