; DESCRIPTION: Renders a black box of size 46x76 starting at (30, 120).
; PLAN: r0=30(x), r1=120(y), r2=46(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 120
LDI r2, 46
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
