; DESCRIPTION: Places a black 116x57 rectangle at position (239, 182).
; PLAN: r0=239(x), r1=182(y), r2=116(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 182
LDI r2, 116
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
