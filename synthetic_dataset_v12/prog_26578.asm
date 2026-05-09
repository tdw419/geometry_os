; DESCRIPTION: Renders a magenta box of size 88x21 starting at (191, 152).
; PLAN: r0=191(x), r1=152(y), r2=88(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 152
LDI r2, 88
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
