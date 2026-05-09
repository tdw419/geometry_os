; DESCRIPTION: Renders a magenta box of size 28x85 starting at (342, 84).
; PLAN: r0=342(x), r1=84(y), r2=28(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 84
LDI r2, 28
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
