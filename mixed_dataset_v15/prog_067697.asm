; DESCRIPTION: Renders a blue box of size 67x44 starting at (27, 138).
; PLAN: r0=27(x), r1=138(y), r2=67(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 138
LDI r2, 67
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
