; DESCRIPTION: Renders a white box of size 65x71 starting at (219, 148).
; PLAN: r0=219(x), r1=148(y), r2=65(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 148
LDI r2, 65
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
