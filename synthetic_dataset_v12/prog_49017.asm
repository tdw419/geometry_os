; DESCRIPTION: Renders a magenta box of size 119x72 starting at (33, 108).
; PLAN: r0=33(x), r1=108(y), r2=119(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 108
LDI r2, 119
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
