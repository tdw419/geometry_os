; DESCRIPTION: Places a red 88x39 rectangle at position (143, 102).
; PLAN: r0=143(x), r1=102(y), r2=88(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 102
LDI r2, 88
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
