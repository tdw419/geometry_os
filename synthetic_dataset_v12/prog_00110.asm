; DESCRIPTION: Renders a magenta box of size 117x120 starting at (188, 56).
; PLAN: r0=188(x), r1=56(y), r2=117(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 56
LDI r2, 117
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
