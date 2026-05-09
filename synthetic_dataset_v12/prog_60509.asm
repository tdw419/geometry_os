; DESCRIPTION: Renders a red box of size 41x24 starting at (173, 201).
; PLAN: r0=173(x), r1=201(y), r2=41(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 201
LDI r2, 41
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
