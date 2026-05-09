; DESCRIPTION: Renders a blue box of size 28x77 starting at (60, 78).
; PLAN: r0=60(x), r1=78(y), r2=28(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 78
LDI r2, 28
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
