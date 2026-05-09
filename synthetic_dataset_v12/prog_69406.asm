; DESCRIPTION: Places a black 86x23 rectangle at position (336, 8).
; PLAN: r0=336(x), r1=8(y), r2=86(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 8
LDI r2, 86
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
