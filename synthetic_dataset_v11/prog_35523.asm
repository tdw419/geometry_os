; DESCRIPTION: Renders a purple box of size 67x68 starting at (40, 16).
; PLAN: r0=40(x), r1=16(y), r2=67(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 16
LDI r2, 67
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
