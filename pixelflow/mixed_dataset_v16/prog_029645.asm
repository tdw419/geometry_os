; DESCRIPTION: Renders a magenta box of size 113x72 starting at (158, 46).
; PLAN: r0=158(x), r1=46(y), r2=113(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 46
LDI r2, 113
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
