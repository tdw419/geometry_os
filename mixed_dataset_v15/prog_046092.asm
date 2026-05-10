; DESCRIPTION: Renders a magenta box of size 113x15 starting at (13, 37).
; PLAN: r0=13(x), r1=37(y), r2=113(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 37
LDI r2, 113
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
