; DESCRIPTION: Places a orange 35x45 rectangle at position (326, 172).
; PLAN: r0=326(x), r1=172(y), r2=35(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 172
LDI r2, 35
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
