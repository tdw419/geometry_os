; DESCRIPTION: Renders a magenta box of size 90x47 starting at (0, 157).
; PLAN: r0=0(x), r1=157(y), r2=90(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 157
LDI r2, 90
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
