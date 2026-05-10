; DESCRIPTION: Places a magenta 37x31 rectangle at position (121, 35).
; PLAN: r0=121(x), r1=35(y), r2=37(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 35
LDI r2, 37
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
