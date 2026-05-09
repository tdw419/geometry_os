; DESCRIPTION: Places a black 89x54 rectangle at position (150, 25).
; PLAN: r0=150(x), r1=25(y), r2=89(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 25
LDI r2, 89
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
