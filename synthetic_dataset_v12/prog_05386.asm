; DESCRIPTION: Renders a magenta box of size 25x27 starting at (462, 44).
; PLAN: r0=462(x), r1=44(y), r2=25(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 44
LDI r2, 25
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
