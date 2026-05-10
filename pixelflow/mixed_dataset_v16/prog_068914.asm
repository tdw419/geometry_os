; DESCRIPTION: Renders a magenta box of size 16x80 starting at (23, 108).
; PLAN: r0=23(x), r1=108(y), r2=16(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 108
LDI r2, 16
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
