; DESCRIPTION: Renders a black box of size 29x65 starting at (388, 14).
; PLAN: r0=388(x), r1=14(y), r2=29(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 14
LDI r2, 29
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
