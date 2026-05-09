; DESCRIPTION: Places a blue 108x49 rectangle at position (119, 146).
; PLAN: r0=119(x), r1=146(y), r2=108(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 146
LDI r2, 108
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
