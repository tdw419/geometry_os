; DESCRIPTION: Renders a blue box of size 65x113 starting at (72, 26).
; PLAN: r0=72(x), r1=26(y), r2=65(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 26
LDI r2, 65
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
