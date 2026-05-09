; DESCRIPTION: Renders a blue box of size 24x44 starting at (25, 14).
; PLAN: r0=25(x), r1=14(y), r2=24(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 14
LDI r2, 24
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
