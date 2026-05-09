; DESCRIPTION: Places a magenta 63x55 rectangle at position (185, 54).
; PLAN: r0=185(x), r1=54(y), r2=63(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 54
LDI r2, 63
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
