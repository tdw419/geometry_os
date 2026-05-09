; DESCRIPTION: Renders a black box of size 65x32 starting at (7, 184).
; PLAN: r0=7(x), r1=184(y), r2=65(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 184
LDI r2, 65
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
