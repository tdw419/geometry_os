; DESCRIPTION: Places a green 69x22 rectangle at position (355, 62).
; PLAN: r0=355(x), r1=62(y), r2=69(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 62
LDI r2, 69
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
