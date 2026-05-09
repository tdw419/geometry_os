; DESCRIPTION: Renders a black box of size 75x26 starting at (70, 18).
; PLAN: r0=70(x), r1=18(y), r2=75(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 18
LDI r2, 75
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
