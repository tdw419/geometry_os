; DESCRIPTION: Renders a white box of size 43x87 starting at (35, 133).
; PLAN: r0=35(x), r1=133(y), r2=43(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 133
LDI r2, 43
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
