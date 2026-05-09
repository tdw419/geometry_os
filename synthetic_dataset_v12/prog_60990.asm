; DESCRIPTION: Renders a white box of size 96x57 starting at (148, 133).
; PLAN: r0=148(x), r1=133(y), r2=96(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 133
LDI r2, 96
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
