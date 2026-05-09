; DESCRIPTION: Places a black 100x27 rectangle at position (299, 159).
; PLAN: r0=299(x), r1=159(y), r2=100(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 159
LDI r2, 100
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
