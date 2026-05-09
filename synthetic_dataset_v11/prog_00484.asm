; DESCRIPTION: Renders a magenta box of size 32x55 starting at (199, 66).
; PLAN: r0=199(x), r1=66(y), r2=32(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 66
LDI r2, 32
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
