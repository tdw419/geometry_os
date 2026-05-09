; DESCRIPTION: Renders a magenta box of size 103x98 starting at (114, 103).
; PLAN: r0=114(x), r1=103(y), r2=103(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 103
LDI r2, 103
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
