; DESCRIPTION: Renders a magenta box of size 100x83 starting at (12, 46).
; PLAN: r0=12(x), r1=46(y), r2=100(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 46
LDI r2, 100
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
