; DESCRIPTION: Places a orange 74x65 box at position (261, 191).
; PLAN: r0=261(x), r1=191(y), r2=74(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 191
LDI r2, 74
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
