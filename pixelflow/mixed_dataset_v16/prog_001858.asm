; DESCRIPTION: Places a blue 48x102 rectangle at position (10, 122).
; PLAN: r0=10(x), r1=122(y), r2=48(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 122
LDI r2, 48
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
