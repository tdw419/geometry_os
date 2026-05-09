; DESCRIPTION: Places a magenta 28x106 rectangle at position (108, 65).
; PLAN: r0=108(x), r1=65(y), r2=28(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 65
LDI r2, 28
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
