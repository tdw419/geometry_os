; DESCRIPTION: Places a blue 22x119 rectangle at position (403, 90).
; PLAN: r0=403(x), r1=90(y), r2=22(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 90
LDI r2, 22
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
