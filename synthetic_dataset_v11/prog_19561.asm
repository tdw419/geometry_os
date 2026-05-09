; DESCRIPTION: Renders a blue box of size 102x57 starting at (58, 45).
; PLAN: r0=58(x), r1=45(y), r2=102(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 45
LDI r2, 102
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
