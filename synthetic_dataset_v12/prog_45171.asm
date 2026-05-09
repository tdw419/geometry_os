; DESCRIPTION: Renders a purple box of size 67x109 starting at (334, 104).
; PLAN: r0=334(x), r1=104(y), r2=67(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 104
LDI r2, 67
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
