; DESCRIPTION: Renders a magenta box of size 61x71 starting at (77, 25).
; PLAN: r0=77(x), r1=25(y), r2=61(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 25
LDI r2, 61
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
