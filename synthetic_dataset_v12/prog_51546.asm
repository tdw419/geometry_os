; DESCRIPTION: Renders a magenta box of size 108x113 starting at (251, 79).
; PLAN: r0=251(x), r1=79(y), r2=108(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 79
LDI r2, 108
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
