; DESCRIPTION: Renders a magenta box of size 22x34 starting at (446, 191).
; PLAN: r0=446(x), r1=191(y), r2=22(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 191
LDI r2, 22
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
