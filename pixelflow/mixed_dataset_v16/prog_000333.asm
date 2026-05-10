; DESCRIPTION: Renders a magenta box of size 36x113 starting at (427, 142).
; PLAN: r0=427(x), r1=142(y), r2=36(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 142
LDI r2, 36
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
