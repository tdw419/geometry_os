; DESCRIPTION: Places a red 105x61 rectangle at position (25, 13).
; PLAN: r0=25(x), r1=13(y), r2=105(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 13
LDI r2, 105
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
