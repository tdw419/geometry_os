; DESCRIPTION: Renders a black box of size 36x84 starting at (360, 18).
; PLAN: r0=360(x), r1=18(y), r2=36(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 18
LDI r2, 36
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
