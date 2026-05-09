; DESCRIPTION: Renders a blue box of size 73x72 starting at (166, 30).
; PLAN: r0=166(x), r1=30(y), r2=73(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 30
LDI r2, 73
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
