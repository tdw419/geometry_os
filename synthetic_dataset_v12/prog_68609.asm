; DESCRIPTION: Renders a magenta box of size 16x108 starting at (165, 51).
; PLAN: r0=165(x), r1=51(y), r2=16(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 51
LDI r2, 16
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
