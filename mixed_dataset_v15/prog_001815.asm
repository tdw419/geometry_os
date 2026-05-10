; DESCRIPTION: Renders a magenta box of size 13x40 starting at (151, 167).
; PLAN: r0=151(x), r1=167(y), r2=13(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 167
LDI r2, 13
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
