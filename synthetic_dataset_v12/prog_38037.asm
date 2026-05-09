; DESCRIPTION: Renders a blue box of size 84x58 starting at (117, 172).
; PLAN: r0=117(x), r1=172(y), r2=84(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 172
LDI r2, 84
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
