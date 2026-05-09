; DESCRIPTION: Places a black 112x53 rectangle at position (130, 95).
; PLAN: r0=130(x), r1=95(y), r2=112(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 95
LDI r2, 112
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
