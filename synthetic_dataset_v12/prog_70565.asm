; DESCRIPTION: Places a green 21x101 rectangle at position (131, 41).
; PLAN: r0=131(x), r1=41(y), r2=21(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 41
LDI r2, 21
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
