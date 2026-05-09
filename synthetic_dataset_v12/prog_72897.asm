; DESCRIPTION: Renders a magenta box of size 45x57 starting at (195, 1).
; PLAN: r0=195(x), r1=1(y), r2=45(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 1
LDI r2, 45
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
