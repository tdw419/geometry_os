; DESCRIPTION: Renders a blue box of size 104x44 starting at (140, 34).
; PLAN: r0=140(x), r1=34(y), r2=104(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 34
LDI r2, 104
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
