; DESCRIPTION: Places a black 106x113 rectangle at position (332, 53).
; PLAN: r0=332(x), r1=53(y), r2=106(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 53
LDI r2, 106
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
