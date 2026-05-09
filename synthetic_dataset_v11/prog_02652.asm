; DESCRIPTION: Renders a magenta box of size 28x108 starting at (31, 143).
; PLAN: r0=31(x), r1=143(y), r2=28(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 143
LDI r2, 28
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
