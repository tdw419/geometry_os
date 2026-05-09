; DESCRIPTION: Renders a black box of size 23x62 starting at (154, 173).
; PLAN: r0=154(x), r1=173(y), r2=23(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 173
LDI r2, 23
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
