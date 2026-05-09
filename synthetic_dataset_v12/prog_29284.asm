; DESCRIPTION: Renders a magenta box of size 70x72 starting at (389, 172).
; PLAN: r0=389(x), r1=172(y), r2=70(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 172
LDI r2, 70
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
