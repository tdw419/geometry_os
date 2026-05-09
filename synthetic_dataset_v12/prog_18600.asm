; DESCRIPTION: Renders a magenta box of size 61x61 starting at (26, 159).
; PLAN: r0=26(x), r1=159(y), r2=61(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 159
LDI r2, 61
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
