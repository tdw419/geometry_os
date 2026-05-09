; DESCRIPTION: Renders a blue box of size 22x26 starting at (408, 71).
; PLAN: r0=408(x), r1=71(y), r2=22(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 71
LDI r2, 22
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
