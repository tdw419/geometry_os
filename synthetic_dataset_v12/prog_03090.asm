; DESCRIPTION: Places a red 85x26 rectangle at position (347, 122).
; PLAN: r0=347(x), r1=122(y), r2=85(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 122
LDI r2, 85
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
