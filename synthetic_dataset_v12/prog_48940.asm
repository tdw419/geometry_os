; DESCRIPTION: Renders a magenta box of size 46x15 starting at (384, 140).
; PLAN: r0=384(x), r1=140(y), r2=46(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 140
LDI r2, 46
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
