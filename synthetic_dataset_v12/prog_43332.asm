; DESCRIPTION: Places a magenta 114x65 rectangle at position (224, 4).
; PLAN: r0=224(x), r1=4(y), r2=114(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 4
LDI r2, 114
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
