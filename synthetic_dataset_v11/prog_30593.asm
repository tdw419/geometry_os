; DESCRIPTION: Renders a magenta box of size 30x102 starting at (197, 26).
; PLAN: r0=197(x), r1=26(y), r2=30(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 26
LDI r2, 30
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
