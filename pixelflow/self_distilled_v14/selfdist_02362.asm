; DESCRIPTION: Places a magenta 94x60 box at position (161, 153).
; PLAN: r0=161(x), r1=153(y), r2=94(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 153
LDI r2, 94
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
