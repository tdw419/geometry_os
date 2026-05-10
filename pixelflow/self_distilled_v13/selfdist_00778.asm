; DESCRIPTION: Places a orange 53x11 box at position (57, 4).
; PLAN: r0=57(x), r1=4(y), r2=53(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 4
LDI r2, 53
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
