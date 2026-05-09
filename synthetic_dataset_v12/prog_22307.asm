; DESCRIPTION: Renders a magenta box of size 119x50 starting at (372, 100).
; PLAN: r0=372(x), r1=100(y), r2=119(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 100
LDI r2, 119
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
