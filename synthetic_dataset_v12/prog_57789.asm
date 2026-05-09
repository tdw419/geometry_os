; DESCRIPTION: Renders a purple box of size 67x120 starting at (329, 34).
; PLAN: r0=329(x), r1=34(y), r2=67(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 34
LDI r2, 67
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
