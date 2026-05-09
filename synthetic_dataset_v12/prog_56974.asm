; DESCRIPTION: Renders a magenta box of size 13x85 starting at (28, 104).
; PLAN: r0=28(x), r1=104(y), r2=13(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 104
LDI r2, 13
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
