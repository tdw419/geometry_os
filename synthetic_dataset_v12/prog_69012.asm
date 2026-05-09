; DESCRIPTION: Places a orange 11x29 rectangle at position (499, 39).
; PLAN: r0=499(x), r1=39(y), r2=11(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 39
LDI r2, 11
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
