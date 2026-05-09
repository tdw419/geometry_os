; DESCRIPTION: Places a orange 43x22 rectangle at position (159, 3).
; PLAN: r0=159(x), r1=3(y), r2=43(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 3
LDI r2, 43
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
