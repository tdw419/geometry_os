; DESCRIPTION: Renders a magenta box of size 70x68 starting at (226, 132).
; PLAN: r0=226(x), r1=132(y), r2=70(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 132
LDI r2, 70
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
