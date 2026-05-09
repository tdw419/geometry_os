; DESCRIPTION: Places a blue 99x41 rectangle at position (122, 130).
; PLAN: r0=122(x), r1=130(y), r2=99(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 130
LDI r2, 99
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
