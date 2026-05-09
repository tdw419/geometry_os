; DESCRIPTION: Renders a magenta box of size 17x27 starting at (175, 109).
; PLAN: r0=175(x), r1=109(y), r2=17(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 109
LDI r2, 17
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
