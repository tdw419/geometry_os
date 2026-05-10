; DESCRIPTION: Renders a white box of size 71x84 starting at (120, 96).
; PLAN: r0=120(x), r1=96(y), r2=71(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 96
LDI r2, 71
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
