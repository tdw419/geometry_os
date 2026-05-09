; DESCRIPTION: Places a black 89x19 rectangle at position (20, 30).
; PLAN: r0=20(x), r1=30(y), r2=89(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 30
LDI r2, 89
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
