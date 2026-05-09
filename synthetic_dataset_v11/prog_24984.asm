; DESCRIPTION: Renders a black box of size 101x115 starting at (60, 20).
; PLAN: r0=60(x), r1=20(y), r2=101(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 20
LDI r2, 101
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
