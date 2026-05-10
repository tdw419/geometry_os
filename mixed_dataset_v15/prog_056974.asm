; DESCRIPTION: Places a black 72x13 rectangle at position (73, 234).
; PLAN: r0=73(x), r1=234(y), r2=72(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 234
LDI r2, 72
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
