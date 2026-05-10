; DESCRIPTION: Places a magenta 90x21 rectangle at position (24, 224).
; PLAN: r0=24(x), r1=224(y), r2=90(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 224
LDI r2, 90
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
