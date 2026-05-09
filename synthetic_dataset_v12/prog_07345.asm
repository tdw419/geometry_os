; DESCRIPTION: Places a orange 52x43 rectangle at position (150, 161).
; PLAN: r0=150(x), r1=161(y), r2=52(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 161
LDI r2, 52
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
