; DESCRIPTION: Places a orange 113x58 rectangle at position (89, 71).
; PLAN: r0=89(x), r1=71(y), r2=113(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 71
LDI r2, 113
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
