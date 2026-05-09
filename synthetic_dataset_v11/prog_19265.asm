; DESCRIPTION: Renders a blue box of size 15x32 starting at (182, 156).
; PLAN: r0=182(x), r1=156(y), r2=15(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 156
LDI r2, 15
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
