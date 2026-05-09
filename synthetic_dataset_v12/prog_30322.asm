; DESCRIPTION: Places a black 99x62 rectangle at position (45, 30).
; PLAN: r0=45(x), r1=30(y), r2=99(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 30
LDI r2, 99
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
