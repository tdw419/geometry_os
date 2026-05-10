; DESCRIPTION: Renders a green box of size 102x70 starting at (15, 116).
; PLAN: r0=15(x), r1=116(y), r2=102(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 116
LDI r2, 102
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
