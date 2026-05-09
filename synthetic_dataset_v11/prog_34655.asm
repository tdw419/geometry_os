; DESCRIPTION: Renders a blue box of size 78x79 starting at (169, 113).
; PLAN: r0=169(x), r1=113(y), r2=78(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 113
LDI r2, 78
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
