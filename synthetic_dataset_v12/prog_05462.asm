; DESCRIPTION: Renders a magenta box of size 68x21 starting at (19, 22).
; PLAN: r0=19(x), r1=22(y), r2=68(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 22
LDI r2, 68
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
