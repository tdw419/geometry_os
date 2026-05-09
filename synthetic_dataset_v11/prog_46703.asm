; DESCRIPTION: Places a orange 76x106 rectangle at position (7, 57).
; PLAN: r0=7(x), r1=57(y), r2=76(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 57
LDI r2, 76
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
