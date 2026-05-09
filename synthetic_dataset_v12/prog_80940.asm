; DESCRIPTION: Places a yellow 84x69 rectangle at position (212, 48).
; PLAN: r0=212(x), r1=48(y), r2=84(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 48
LDI r2, 84
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
