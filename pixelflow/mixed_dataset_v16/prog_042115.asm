; DESCRIPTION: Renders a magenta box of size 102x69 starting at (353, 150).
; PLAN: r0=353(x), r1=150(y), r2=102(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 150
LDI r2, 102
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
