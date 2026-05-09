; DESCRIPTION: Renders a blue box of size 58x102 starting at (172, 60).
; PLAN: r0=172(x), r1=60(y), r2=58(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 60
LDI r2, 58
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
