; DESCRIPTION: Places a magenta 43x49 rectangle at position (370, 119).
; PLAN: r0=370(x), r1=119(y), r2=43(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 119
LDI r2, 43
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
