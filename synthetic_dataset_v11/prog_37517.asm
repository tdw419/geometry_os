; DESCRIPTION: Renders a magenta box of size 38x59 starting at (90, 51).
; PLAN: r0=90(x), r1=51(y), r2=38(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 51
LDI r2, 38
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
