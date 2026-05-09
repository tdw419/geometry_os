; DESCRIPTION: Places a black 35x60 rectangle at position (31, 193).
; PLAN: r0=31(x), r1=193(y), r2=35(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 193
LDI r2, 35
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
