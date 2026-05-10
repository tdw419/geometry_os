; DESCRIPTION: Places a yellow 24x13 rectangle at position (130, 155).
; PLAN: r0=130(x), r1=155(y), r2=24(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 155
LDI r2, 24
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
