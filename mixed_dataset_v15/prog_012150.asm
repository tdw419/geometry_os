; DESCRIPTION: Places a blue 39x108 rectangle at position (75, 141).
; PLAN: r0=75(x), r1=141(y), r2=39(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 141
LDI r2, 39
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
