; DESCRIPTION: Places a orange 118x20 rectangle at position (59, 43).
; PLAN: r0=59(x), r1=43(y), r2=118(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 43
LDI r2, 118
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
