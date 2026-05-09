; DESCRIPTION: Places a blue 101x41 rectangle at position (30, 49).
; PLAN: r0=30(x), r1=49(y), r2=101(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 49
LDI r2, 101
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
