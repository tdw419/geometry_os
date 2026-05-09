; DESCRIPTION: Renders a magenta box of size 17x115 starting at (328, 105).
; PLAN: r0=328(x), r1=105(y), r2=17(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 105
LDI r2, 17
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
