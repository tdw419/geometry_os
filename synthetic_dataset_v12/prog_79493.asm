; DESCRIPTION: Renders a blue box of size 40x99 starting at (167, 60).
; PLAN: r0=167(x), r1=60(y), r2=40(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 60
LDI r2, 40
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
