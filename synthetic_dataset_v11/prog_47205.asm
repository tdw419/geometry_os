; DESCRIPTION: Renders a blue box of size 10x26 starting at (60, 7).
; PLAN: r0=60(x), r1=7(y), r2=10(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 7
LDI r2, 10
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
