; DESCRIPTION: Places a orange 98x86 rectangle at position (134, 78).
; PLAN: r0=134(x), r1=78(y), r2=98(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 78
LDI r2, 98
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
