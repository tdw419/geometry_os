; DESCRIPTION: Places a magenta 108x119 rectangle at position (39, 37).
; PLAN: r0=39(x), r1=37(y), r2=108(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 37
LDI r2, 108
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
