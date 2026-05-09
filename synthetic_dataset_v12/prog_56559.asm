; DESCRIPTION: Renders a black box of size 99x50 starting at (99, 176).
; PLAN: r0=99(x), r1=176(y), r2=99(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 176
LDI r2, 99
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
