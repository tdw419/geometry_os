; DESCRIPTION: Places a red 112x88 rectangle at position (26, 27).
; PLAN: r0=26(x), r1=27(y), r2=112(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 27
LDI r2, 112
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
