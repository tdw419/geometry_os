; DESCRIPTION: Renders a black box of size 103x14 starting at (38, 217).
; PLAN: r0=38(x), r1=217(y), r2=103(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 217
LDI r2, 103
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
