; DESCRIPTION: Renders a black box of size 105x54 starting at (59, 50).
; PLAN: r0=59(x), r1=50(y), r2=105(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 50
LDI r2, 105
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
