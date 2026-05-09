; DESCRIPTION: Renders a blue box of size 51x11 starting at (268, 28).
; PLAN: r0=268(x), r1=28(y), r2=51(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 28
LDI r2, 51
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
