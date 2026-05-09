; DESCRIPTION: Places a magenta 22x63 rectangle at position (217, 191).
; PLAN: r0=217(x), r1=191(y), r2=22(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 191
LDI r2, 22
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
