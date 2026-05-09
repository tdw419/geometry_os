; DESCRIPTION: Renders a magenta box of size 108x49 starting at (11, 70).
; PLAN: r0=11(x), r1=70(y), r2=108(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 70
LDI r2, 108
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
