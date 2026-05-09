; DESCRIPTION: Places a blue 50x76 rectangle at position (78, 141).
; PLAN: r0=78(x), r1=141(y), r2=50(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 141
LDI r2, 50
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
