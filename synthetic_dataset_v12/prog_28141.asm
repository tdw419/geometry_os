; DESCRIPTION: Renders a magenta box of size 101x56 starting at (272, 50).
; PLAN: r0=272(x), r1=50(y), r2=101(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 50
LDI r2, 101
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
