; DESCRIPTION: Places a green 116x43 rectangle at position (114, 56).
; PLAN: r0=114(x), r1=56(y), r2=116(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 56
LDI r2, 116
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
