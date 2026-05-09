; DESCRIPTION: Places a red 71x114 rectangle at position (28, 73).
; PLAN: r0=28(x), r1=73(y), r2=71(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 73
LDI r2, 71
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
