; DESCRIPTION: Places a orange 52x25 box at position (111, 122).
; PLAN: r0=111(x), r1=122(y), r2=52(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 122
LDI r2, 52
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
