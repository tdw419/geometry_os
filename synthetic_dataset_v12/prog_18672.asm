; DESCRIPTION: Places a orange 19x18 rectangle at position (66, 60).
; PLAN: r0=66(x), r1=60(y), r2=19(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 60
LDI r2, 19
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
