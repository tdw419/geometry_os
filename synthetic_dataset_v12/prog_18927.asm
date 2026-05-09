; DESCRIPTION: Places a magenta 71x66 rectangle at position (205, 68).
; PLAN: r0=205(x), r1=68(y), r2=71(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 68
LDI r2, 71
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
