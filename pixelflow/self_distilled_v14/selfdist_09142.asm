; DESCRIPTION: Places a orange 30x19 box at position (349, 1).
; PLAN: r0=349(x), r1=1(y), r2=30(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 1
LDI r2, 30
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
