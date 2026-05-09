; DESCRIPTION: Places a orange 61x14 rectangle at position (25, 159).
; PLAN: r0=25(x), r1=159(y), r2=61(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 159
LDI r2, 61
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
