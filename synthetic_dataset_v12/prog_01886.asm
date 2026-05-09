; DESCRIPTION: Places a black 60x73 rectangle at position (45, 33).
; PLAN: r0=45(x), r1=33(y), r2=60(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 33
LDI r2, 60
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
