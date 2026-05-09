; DESCRIPTION: Renders a black box of size 20x14 starting at (60, 28).
; PLAN: r0=60(x), r1=28(y), r2=20(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 28
LDI r2, 20
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
