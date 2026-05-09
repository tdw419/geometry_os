; DESCRIPTION: Renders a black box of size 79x76 starting at (184, 92).
; PLAN: r0=184(x), r1=92(y), r2=79(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 92
LDI r2, 79
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
