; DESCRIPTION: Creates a magenta filled rectangle of size 51x46 starting at (80, 79).
; PLAN: r0=80(x), r1=79(y), r2=51(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 79
LDI r2, 51
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
