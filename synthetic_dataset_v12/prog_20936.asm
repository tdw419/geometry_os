; DESCRIPTION: Places a yellow 59x108 rectangle at position (101, 83).
; PLAN: r0=101(x), r1=83(y), r2=59(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 83
LDI r2, 59
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
