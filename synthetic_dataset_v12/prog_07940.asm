; DESCRIPTION: Places a orange 45x21 rectangle at position (383, 159).
; PLAN: r0=383(x), r1=159(y), r2=45(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 159
LDI r2, 45
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
