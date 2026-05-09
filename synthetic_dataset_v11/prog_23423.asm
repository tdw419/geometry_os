; DESCRIPTION: Renders a black box of size 24x102 starting at (209, 70).
; PLAN: r0=209(x), r1=70(y), r2=24(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 70
LDI r2, 24
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
