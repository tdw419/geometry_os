; DESCRIPTION: Places a yellow 62x69 rectangle at position (87, 90).
; PLAN: r0=87(x), r1=90(y), r2=62(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 90
LDI r2, 62
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
