; DESCRIPTION: Places a orange 118x10 rectangle at position (118, 212).
; PLAN: r0=118(x), r1=212(y), r2=118(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 212
LDI r2, 118
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
