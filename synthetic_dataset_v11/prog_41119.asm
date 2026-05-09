; DESCRIPTION: Places a magenta 70x117 rectangle at position (65, 108).
; PLAN: r0=65(x), r1=108(y), r2=70(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 108
LDI r2, 70
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
