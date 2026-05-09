; DESCRIPTION: Renders a magenta box of size 80x77 starting at (87, 53).
; PLAN: r0=87(x), r1=53(y), r2=80(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 53
LDI r2, 80
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
