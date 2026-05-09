; DESCRIPTION: Places a orange 76x76 rectangle at position (50, 85).
; PLAN: r0=50(x), r1=85(y), r2=76(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 85
LDI r2, 76
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
