; DESCRIPTION: Places a orange 115x78 rectangle at position (380, 81).
; PLAN: r0=380(x), r1=81(y), r2=115(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 81
LDI r2, 115
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
