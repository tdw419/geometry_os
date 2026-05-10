; DESCRIPTION: Renders a white box of size 96x45 starting at (17, 90).
; PLAN: r0=17(x), r1=90(y), r2=96(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 90
LDI r2, 96
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
