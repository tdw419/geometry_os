; DESCRIPTION: Renders a green box of size 55x88 starting at (444, 82).
; PLAN: r0=444(x), r1=82(y), r2=55(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 82
LDI r2, 55
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
