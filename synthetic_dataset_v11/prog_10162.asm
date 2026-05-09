; DESCRIPTION: Renders a magenta box of size 45x45 starting at (60, 30).
; PLAN: r0=60(x), r1=30(y), r2=45(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 30
LDI r2, 45
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
