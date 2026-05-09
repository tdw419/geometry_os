; DESCRIPTION: Renders a black box of size 108x75 starting at (65, 173).
; PLAN: r0=65(x), r1=173(y), r2=108(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 173
LDI r2, 108
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
