; DESCRIPTION: Places a white 53x113 rectangle at position (11, 17).
; PLAN: r0=11(x), r1=17(y), r2=53(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 17
LDI r2, 53
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
