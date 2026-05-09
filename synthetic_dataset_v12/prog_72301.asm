; DESCRIPTION: Places a orange 75x39 rectangle at position (134, 47).
; PLAN: r0=134(x), r1=47(y), r2=75(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 47
LDI r2, 75
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
