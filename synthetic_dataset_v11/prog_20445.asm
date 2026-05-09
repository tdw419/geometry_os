; DESCRIPTION: Renders a white box of size 108x73 starting at (82, 121).
; PLAN: r0=82(x), r1=121(y), r2=108(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 121
LDI r2, 108
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
