; DESCRIPTION: Places a black 87x56 rectangle at position (406, 30).
; PLAN: r0=406(x), r1=30(y), r2=87(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 30
LDI r2, 87
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
