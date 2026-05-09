; DESCRIPTION: Renders a blue box of size 21x60 starting at (108, 153).
; PLAN: r0=108(x), r1=153(y), r2=21(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 153
LDI r2, 21
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
