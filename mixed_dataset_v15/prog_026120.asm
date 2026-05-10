; DESCRIPTION: Places a black 78x50 rectangle at position (137, 32).
; PLAN: r0=137(x), r1=32(y), r2=78(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 32
LDI r2, 78
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
