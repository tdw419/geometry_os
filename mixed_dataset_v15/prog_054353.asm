; DESCRIPTION: Places a orange 17x70 box at position (183, 143).
; PLAN: r0=183(x), r1=143(y), r2=17(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 143
LDI r2, 17
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
