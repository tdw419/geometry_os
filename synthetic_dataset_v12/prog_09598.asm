; DESCRIPTION: Places a blue 41x40 rectangle at position (204, 71).
; PLAN: r0=204(x), r1=71(y), r2=41(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 71
LDI r2, 41
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
