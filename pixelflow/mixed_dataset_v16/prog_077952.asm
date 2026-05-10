; DESCRIPTION: Renders a purple box of size 67x55 starting at (210, 109).
; PLAN: r0=210(x), r1=109(y), r2=67(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 109
LDI r2, 67
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
