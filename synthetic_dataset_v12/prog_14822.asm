; DESCRIPTION: Renders a magenta box of size 63x74 starting at (162, 152).
; PLAN: r0=162(x), r1=152(y), r2=63(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 152
LDI r2, 63
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
