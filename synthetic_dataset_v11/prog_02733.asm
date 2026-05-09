; DESCRIPTION: Renders a blue box of size 25x102 starting at (57, 127).
; PLAN: r0=57(x), r1=127(y), r2=25(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 127
LDI r2, 25
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
