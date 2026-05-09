; DESCRIPTION: Places a orange 61x63 rectangle at position (162, 159).
; PLAN: r0=162(x), r1=159(y), r2=61(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 159
LDI r2, 61
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
