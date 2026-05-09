; DESCRIPTION: Places a black 21x11 rectangle at position (412, 30).
; PLAN: r0=412(x), r1=30(y), r2=21(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 30
LDI r2, 21
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
