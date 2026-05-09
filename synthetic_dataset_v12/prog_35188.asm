; DESCRIPTION: Renders a black box of size 70x103 starting at (128, 102).
; PLAN: r0=128(x), r1=102(y), r2=70(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 102
LDI r2, 70
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
