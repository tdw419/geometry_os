; DESCRIPTION: Places a magenta 82x66 rectangle at position (222, 160).
; PLAN: r0=222(x), r1=160(y), r2=82(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 160
LDI r2, 82
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
