; DESCRIPTION: Places a white 52x81 rectangle at position (114, 61).
; PLAN: r0=114(x), r1=61(y), r2=52(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 61
LDI r2, 52
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
