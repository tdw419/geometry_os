; DESCRIPTION: Renders a magenta box of size 89x91 starting at (50, 60).
; PLAN: r0=50(x), r1=60(y), r2=89(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 60
LDI r2, 89
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
