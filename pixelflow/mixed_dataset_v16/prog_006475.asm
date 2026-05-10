; DESCRIPTION: Places a orange 82x118 rectangle at position (64, 138).
; PLAN: r0=64(x), r1=138(y), r2=82(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 138
LDI r2, 82
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
