; DESCRIPTION: Places a purple 26x61 rectangle at position (189, 144).
; PLAN: r0=189(x), r1=144(y), r2=26(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 144
LDI r2, 26
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
