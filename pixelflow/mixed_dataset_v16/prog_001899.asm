; DESCRIPTION: Renders a red box of size 89x103 starting at (379, 27).
; PLAN: r0=379(x), r1=27(y), r2=89(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 27
LDI r2, 89
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
