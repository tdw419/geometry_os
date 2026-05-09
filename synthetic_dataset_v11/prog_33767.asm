; DESCRIPTION: Renders a blue box of size 75x104 starting at (171, 67).
; PLAN: r0=171(x), r1=67(y), r2=75(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 67
LDI r2, 75
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
