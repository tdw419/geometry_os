; DESCRIPTION: Places a orange 114x119 rectangle at position (130, 72).
; PLAN: r0=130(x), r1=72(y), r2=114(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 72
LDI r2, 114
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
