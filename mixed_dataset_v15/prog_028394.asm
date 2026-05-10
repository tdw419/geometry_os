; DESCRIPTION: Renders a magenta box of size 83x75 starting at (73, 49).
; PLAN: r0=73(x), r1=49(y), r2=83(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 49
LDI r2, 83
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
