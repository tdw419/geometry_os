; DESCRIPTION: Places a yellow 59x21 rectangle at position (68, 122).
; PLAN: r0=68(x), r1=122(y), r2=59(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 122
LDI r2, 59
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
