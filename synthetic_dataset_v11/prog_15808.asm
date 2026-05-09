; DESCRIPTION: Places a blue 56x41 rectangle at position (28, 147).
; PLAN: r0=28(x), r1=147(y), r2=56(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 147
LDI r2, 56
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
