; DESCRIPTION: Renders a black box of size 120x76 starting at (185, 88).
; PLAN: r0=185(x), r1=88(y), r2=120(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 88
LDI r2, 120
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
