; DESCRIPTION: Renders a magenta box of size 76x23 starting at (222, 37).
; PLAN: r0=222(x), r1=37(y), r2=76(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 37
LDI r2, 76
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
