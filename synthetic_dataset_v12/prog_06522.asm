; DESCRIPTION: Places a orange 86x12 rectangle at position (115, 6).
; PLAN: r0=115(x), r1=6(y), r2=86(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 6
LDI r2, 86
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
