; DESCRIPTION: Renders a magenta box of size 58x82 starting at (91, 18).
; PLAN: r0=91(x), r1=18(y), r2=58(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 18
LDI r2, 58
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
