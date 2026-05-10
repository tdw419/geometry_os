; DESCRIPTION: Places a orange 43x81 rectangle at position (189, 71).
; PLAN: r0=189(x), r1=71(y), r2=43(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 71
LDI r2, 43
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
