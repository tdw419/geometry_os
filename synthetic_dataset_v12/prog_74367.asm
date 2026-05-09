; DESCRIPTION: Places a red 116x18 rectangle at position (157, 17).
; PLAN: r0=157(x), r1=17(y), r2=116(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 17
LDI r2, 116
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
