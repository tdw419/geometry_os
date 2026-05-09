; DESCRIPTION: Places a red 49x113 rectangle at position (304, 116).
; PLAN: r0=304(x), r1=116(y), r2=49(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 116
LDI r2, 49
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
