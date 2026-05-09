; DESCRIPTION: Renders a black box of size 73x16 starting at (49, 65).
; PLAN: r0=49(x), r1=65(y), r2=73(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 65
LDI r2, 73
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
