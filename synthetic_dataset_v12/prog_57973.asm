; DESCRIPTION: Renders a black box of size 30x11 starting at (446, 118).
; PLAN: r0=446(x), r1=118(y), r2=30(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 118
LDI r2, 30
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
