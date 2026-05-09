; DESCRIPTION: Renders a magenta box of size 58x100 starting at (152, 148).
; PLAN: r0=152(x), r1=148(y), r2=58(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 148
LDI r2, 58
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
