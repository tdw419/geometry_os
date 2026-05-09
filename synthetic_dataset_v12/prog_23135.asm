; DESCRIPTION: Places a blue 60x108 rectangle at position (246, 115).
; PLAN: r0=246(x), r1=115(y), r2=60(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 115
LDI r2, 60
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
