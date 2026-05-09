; DESCRIPTION: Renders a magenta box of size 113x37 starting at (126, 15).
; PLAN: r0=126(x), r1=15(y), r2=113(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 15
LDI r2, 113
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
