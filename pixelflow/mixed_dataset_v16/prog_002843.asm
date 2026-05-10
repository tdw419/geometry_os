; DESCRIPTION: Places a orange 12x103 box at position (348, 17).
; PLAN: r0=348(x), r1=17(y), r2=12(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 17
LDI r2, 12
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
