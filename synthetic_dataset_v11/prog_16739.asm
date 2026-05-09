; DESCRIPTION: Renders a blue box of size 67x79 starting at (95, 5).
; PLAN: r0=95(x), r1=5(y), r2=67(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 5
LDI r2, 67
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
