; DESCRIPTION: Renders a magenta box of size 19x96 starting at (228, 152).
; PLAN: r0=228(x), r1=152(y), r2=19(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 152
LDI r2, 19
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
