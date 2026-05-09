; DESCRIPTION: Renders a magenta box of size 100x19 starting at (152, 91).
; PLAN: r0=152(x), r1=91(y), r2=100(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 91
LDI r2, 100
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
