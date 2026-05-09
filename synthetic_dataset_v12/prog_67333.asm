; DESCRIPTION: Renders a magenta box of size 120x15 starting at (148, 46).
; PLAN: r0=148(x), r1=46(y), r2=120(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 46
LDI r2, 120
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
