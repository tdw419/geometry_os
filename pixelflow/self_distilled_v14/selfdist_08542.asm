; DESCRIPTION: Places a orange 17x84 box at position (340, 131).
; PLAN: r0=340(x), r1=131(y), r2=17(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 131
LDI r2, 17
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
