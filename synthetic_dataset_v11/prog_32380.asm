; DESCRIPTION: Renders a magenta box of size 103x79 starting at (138, 19).
; PLAN: r0=138(x), r1=19(y), r2=103(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 19
LDI r2, 103
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
