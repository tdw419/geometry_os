; DESCRIPTION: Renders a red box of size 49x82 starting at (379, 112).
; PLAN: r0=379(x), r1=112(y), r2=49(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 112
LDI r2, 49
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
