; DESCRIPTION: Places a orange 72x57 rectangle at position (119, 114).
; PLAN: r0=119(x), r1=114(y), r2=72(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 114
LDI r2, 72
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
