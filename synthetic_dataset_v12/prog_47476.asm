; DESCRIPTION: Renders a blue box of size 71x15 starting at (64, 46).
; PLAN: r0=64(x), r1=46(y), r2=71(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 46
LDI r2, 71
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
