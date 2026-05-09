; DESCRIPTION: Places a orange 22x77 rectangle at position (3, 43).
; PLAN: r0=3(x), r1=43(y), r2=22(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 43
LDI r2, 22
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
