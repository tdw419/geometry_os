; DESCRIPTION: Renders a green box of size 67x90 starting at (112, 90).
; PLAN: r0=112(x), r1=90(y), r2=67(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 90
LDI r2, 67
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
