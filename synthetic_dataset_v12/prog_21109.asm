; DESCRIPTION: Renders a magenta box of size 45x26 starting at (79, 80).
; PLAN: r0=79(x), r1=80(y), r2=45(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 80
LDI r2, 45
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
