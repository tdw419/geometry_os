; DESCRIPTION: Places a blue 38x84 rectangle at position (427, 41).
; PLAN: r0=427(x), r1=41(y), r2=38(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 41
LDI r2, 38
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
