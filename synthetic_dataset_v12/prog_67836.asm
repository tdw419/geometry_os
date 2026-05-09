; DESCRIPTION: Renders a magenta box of size 36x92 starting at (470, 151).
; PLAN: r0=470(x), r1=151(y), r2=36(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 151
LDI r2, 36
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
