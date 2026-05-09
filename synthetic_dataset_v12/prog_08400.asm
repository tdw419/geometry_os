; DESCRIPTION: Renders a magenta box of size 21x62 starting at (423, 40).
; PLAN: r0=423(x), r1=40(y), r2=21(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 40
LDI r2, 21
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
