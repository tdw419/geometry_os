; DESCRIPTION: Places a magenta 16x107 rectangle at position (357, 37).
; PLAN: r0=357(x), r1=37(y), r2=16(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 37
LDI r2, 16
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
