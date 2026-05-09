; DESCRIPTION: Renders a green box of size 108x69 starting at (59, 80).
; PLAN: r0=59(x), r1=80(y), r2=108(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 80
LDI r2, 108
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
