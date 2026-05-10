; DESCRIPTION: Renders a magenta box of size 113x28 starting at (148, 76).
; PLAN: r0=148(x), r1=76(y), r2=113(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 76
LDI r2, 113
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
