; DESCRIPTION: Renders a magenta box of size 79x44 starting at (48, 179).
; PLAN: r0=48(x), r1=179(y), r2=79(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 179
LDI r2, 79
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
