; DESCRIPTION: Renders a white box of size 30x17 starting at (37, 96).
; PLAN: r0=37(x), r1=96(y), r2=30(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 96
LDI r2, 30
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
