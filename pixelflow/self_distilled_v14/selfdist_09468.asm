; DESCRIPTION: Places a orange 84x39 box at position (55, 19).
; PLAN: r0=55(x), r1=19(y), r2=84(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 19
LDI r2, 84
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
