; DESCRIPTION: Places a yellow 74x61 rectangle at position (157, 3).
; PLAN: r0=157(x), r1=3(y), r2=74(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 3
LDI r2, 74
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
