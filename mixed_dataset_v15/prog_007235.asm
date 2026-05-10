; DESCRIPTION: Places a magenta 65x38 rectangle at position (145, 23).
; PLAN: r0=145(x), r1=23(y), r2=65(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 23
LDI r2, 65
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
