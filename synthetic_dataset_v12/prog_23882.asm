; DESCRIPTION: Places a green 69x80 rectangle at position (145, 108).
; PLAN: r0=145(x), r1=108(y), r2=69(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 108
LDI r2, 69
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
