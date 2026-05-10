; DESCRIPTION: Renders a magenta box of size 78x48 starting at (368, 175).
; PLAN: r0=368(x), r1=175(y), r2=78(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 175
LDI r2, 78
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
