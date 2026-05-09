; DESCRIPTION: Places a black 43x72 rectangle at position (456, 95).
; PLAN: r0=456(x), r1=95(y), r2=43(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 95
LDI r2, 43
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
