; DESCRIPTION: Renders a blue box of size 104x74 starting at (400, 93).
; PLAN: r0=400(x), r1=93(y), r2=104(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 93
LDI r2, 104
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
