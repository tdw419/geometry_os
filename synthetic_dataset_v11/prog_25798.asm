; DESCRIPTION: Renders a magenta box of size 53x47 starting at (134, 44).
; PLAN: r0=134(x), r1=44(y), r2=53(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 44
LDI r2, 53
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
