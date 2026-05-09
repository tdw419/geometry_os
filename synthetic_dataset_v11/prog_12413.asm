; DESCRIPTION: Renders a magenta box of size 27x38 starting at (133, 151).
; PLAN: r0=133(x), r1=151(y), r2=27(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 151
LDI r2, 27
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
