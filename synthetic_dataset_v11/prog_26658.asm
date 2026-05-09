; DESCRIPTION: Renders a magenta box of size 25x21 starting at (87, 118).
; PLAN: r0=87(x), r1=118(y), r2=25(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 118
LDI r2, 25
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
