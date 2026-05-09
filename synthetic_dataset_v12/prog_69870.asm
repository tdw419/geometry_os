; DESCRIPTION: Renders a blue box of size 22x58 starting at (311, 171).
; PLAN: r0=311(x), r1=171(y), r2=22(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 171
LDI r2, 22
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
