; DESCRIPTION: Places a magenta 37x75 rectangle at position (121, 5).
; PLAN: r0=121(x), r1=5(y), r2=37(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 5
LDI r2, 37
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
