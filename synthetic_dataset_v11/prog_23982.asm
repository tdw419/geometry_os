; DESCRIPTION: Places a orange 115x50 rectangle at position (79, 100).
; PLAN: r0=79(x), r1=100(y), r2=115(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 100
LDI r2, 115
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
