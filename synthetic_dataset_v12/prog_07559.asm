; DESCRIPTION: Places a orange 93x116 rectangle at position (49, 2).
; PLAN: r0=49(x), r1=2(y), r2=93(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 2
LDI r2, 93
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
