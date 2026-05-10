; DESCRIPTION: Renders a magenta box of size 111x96 starting at (87, 75).
; PLAN: r0=87(x), r1=75(y), r2=111(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 75
LDI r2, 111
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
