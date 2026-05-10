; DESCRIPTION: Places a blue 41x65 rectangle at position (376, 1).
; PLAN: r0=376(x), r1=1(y), r2=41(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 1
LDI r2, 41
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
