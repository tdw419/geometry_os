; DESCRIPTION: Places a orange 105x18 rectangle at position (75, 189).
; PLAN: r0=75(x), r1=189(y), r2=105(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 189
LDI r2, 105
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
