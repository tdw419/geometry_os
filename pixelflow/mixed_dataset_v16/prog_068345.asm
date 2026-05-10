; DESCRIPTION: Places a black 100x116 rectangle at position (298, 53).
; PLAN: r0=298(x), r1=53(y), r2=100(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 53
LDI r2, 100
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
