; DESCRIPTION: Places a black 20x41 rectangle at position (156, 38).
; PLAN: r0=156(x), r1=38(y), r2=20(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 38
LDI r2, 20
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
