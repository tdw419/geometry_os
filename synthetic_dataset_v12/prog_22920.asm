; DESCRIPTION: Places a yellow 32x114 rectangle at position (317, 108).
; PLAN: r0=317(x), r1=108(y), r2=32(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 108
LDI r2, 32
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
