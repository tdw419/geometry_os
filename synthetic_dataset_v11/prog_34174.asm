; DESCRIPTION: Renders a black box of size 38x55 starting at (25, 26).
; PLAN: r0=25(x), r1=26(y), r2=38(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 26
LDI r2, 38
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
