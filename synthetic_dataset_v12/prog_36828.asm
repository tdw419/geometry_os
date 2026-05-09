; DESCRIPTION: Renders a magenta box of size 40x21 starting at (51, 98).
; PLAN: r0=51(x), r1=98(y), r2=40(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 98
LDI r2, 40
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
