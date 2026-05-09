; DESCRIPTION: Places a red 88x77 rectangle at position (107, 88).
; PLAN: r0=107(x), r1=88(y), r2=88(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 88
LDI r2, 88
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
