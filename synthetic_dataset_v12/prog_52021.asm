; DESCRIPTION: Places a orange 107x10 rectangle at position (85, 198).
; PLAN: r0=85(x), r1=198(y), r2=107(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 198
LDI r2, 107
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
