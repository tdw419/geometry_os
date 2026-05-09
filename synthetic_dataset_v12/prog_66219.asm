; DESCRIPTION: Renders a red box of size 10x103 starting at (379, 134).
; PLAN: r0=379(x), r1=134(y), r2=10(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 134
LDI r2, 10
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
