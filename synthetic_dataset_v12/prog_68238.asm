; DESCRIPTION: Places a orange 82x26 rectangle at position (105, 85).
; PLAN: r0=105(x), r1=85(y), r2=82(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 85
LDI r2, 82
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
