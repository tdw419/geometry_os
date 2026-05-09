; DESCRIPTION: Renders a magenta box of size 59x60 starting at (411, 81).
; PLAN: r0=411(x), r1=81(y), r2=59(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 81
LDI r2, 59
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
