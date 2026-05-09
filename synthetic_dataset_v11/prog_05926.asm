; DESCRIPTION: Renders a magenta box of size 96x79 starting at (69, 31).
; PLAN: r0=69(x), r1=31(y), r2=96(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 31
LDI r2, 96
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
