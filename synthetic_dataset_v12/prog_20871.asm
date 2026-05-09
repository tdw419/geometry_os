; DESCRIPTION: Places a orange 113x102 rectangle at position (207, 62).
; PLAN: r0=207(x), r1=62(y), r2=113(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 62
LDI r2, 113
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
