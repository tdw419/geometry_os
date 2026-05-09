; DESCRIPTION: Renders a black box of size 90x30 starting at (15, 216).
; PLAN: r0=15(x), r1=216(y), r2=90(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 216
LDI r2, 90
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
