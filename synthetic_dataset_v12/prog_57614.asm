; DESCRIPTION: Places a blue 13x15 rectangle at position (34, 48).
; PLAN: r0=34(x), r1=48(y), r2=13(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 48
LDI r2, 13
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
