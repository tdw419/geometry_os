; DESCRIPTION: Places a red 35x107 rectangle at position (178, 101).
; PLAN: r0=178(x), r1=101(y), r2=35(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 101
LDI r2, 35
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
