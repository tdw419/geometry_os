; DESCRIPTION: Renders a white box of size 90x29 starting at (65, 133).
; PLAN: r0=65(x), r1=133(y), r2=90(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 133
LDI r2, 90
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
