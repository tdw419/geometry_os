; DESCRIPTION: Places a orange 95x119 rectangle at position (319, 72).
; PLAN: r0=319(x), r1=72(y), r2=95(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 72
LDI r2, 95
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
