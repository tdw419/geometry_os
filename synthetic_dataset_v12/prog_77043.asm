; DESCRIPTION: Renders a magenta box of size 20x39 starting at (207, 43).
; PLAN: r0=207(x), r1=43(y), r2=20(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 43
LDI r2, 20
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
