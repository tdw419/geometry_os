; DESCRIPTION: Places a blue 63x27 rectangle at position (414, 56).
; PLAN: r0=414(x), r1=56(y), r2=63(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 56
LDI r2, 63
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
