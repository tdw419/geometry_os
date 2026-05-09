; DESCRIPTION: Renders a magenta box of size 108x88 starting at (39, 152).
; PLAN: r0=39(x), r1=152(y), r2=108(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 152
LDI r2, 108
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
