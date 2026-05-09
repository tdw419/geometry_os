; DESCRIPTION: Renders a magenta box of size 76x84 starting at (87, 108).
; PLAN: r0=87(x), r1=108(y), r2=76(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 108
LDI r2, 76
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
