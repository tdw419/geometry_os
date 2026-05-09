; DESCRIPTION: Renders a blue box of size 46x44 starting at (138, 6).
; PLAN: r0=138(x), r1=6(y), r2=46(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 6
LDI r2, 46
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
