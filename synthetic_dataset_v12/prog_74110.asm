; DESCRIPTION: Places a blue 41x15 rectangle at position (65, 98).
; PLAN: r0=65(x), r1=98(y), r2=41(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 98
LDI r2, 41
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
