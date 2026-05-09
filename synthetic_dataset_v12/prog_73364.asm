; DESCRIPTION: Places a blue 41x12 rectangle at position (108, 43).
; PLAN: r0=108(x), r1=43(y), r2=41(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 43
LDI r2, 41
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
