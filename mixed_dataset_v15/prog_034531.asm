; DESCRIPTION: Places a magenta 86x37 rectangle at position (152, 43).
; PLAN: r0=152(x), r1=43(y), r2=86(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 43
LDI r2, 86
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
