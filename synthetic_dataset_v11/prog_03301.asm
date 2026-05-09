; DESCRIPTION: Renders a white box of size 82x116 starting at (148, 121).
; PLAN: r0=148(x), r1=121(y), r2=82(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 121
LDI r2, 82
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
