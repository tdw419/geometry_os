; DESCRIPTION: Renders a blue box of size 114x115 starting at (39, 31).
; PLAN: r0=39(x), r1=31(y), r2=114(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 31
LDI r2, 114
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
