; DESCRIPTION: Places a yellow 59x13 rectangle at position (19, 130).
; PLAN: r0=19(x), r1=130(y), r2=59(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 130
LDI r2, 59
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
