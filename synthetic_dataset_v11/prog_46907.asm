; DESCRIPTION: Renders a blue box of size 84x116 starting at (164, 106).
; PLAN: r0=164(x), r1=106(y), r2=84(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 106
LDI r2, 84
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
