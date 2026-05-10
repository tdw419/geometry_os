; DESCRIPTION: Creates a magenta filled rectangle of size 79x35 starting at (367, 132).
; PLAN: r0=367(x), r1=132(y), r2=79(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 132
LDI r2, 79
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
