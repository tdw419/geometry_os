; DESCRIPTION: Places a yellow 62x52 rectangle at position (170, 108).
; PLAN: r0=170(x), r1=108(y), r2=62(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 108
LDI r2, 62
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
