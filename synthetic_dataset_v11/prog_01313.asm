; DESCRIPTION: Places a yellow 108x21 rectangle at position (101, 211).
; PLAN: r0=101(x), r1=211(y), r2=108(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 211
LDI r2, 108
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
