; DESCRIPTION: Places a black 45x44 rectangle at position (324, 206).
; PLAN: r0=324(x), r1=206(y), r2=45(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 206
LDI r2, 45
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
