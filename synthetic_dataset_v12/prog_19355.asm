; DESCRIPTION: Renders a magenta box of size 56x66 starting at (70, 150).
; PLAN: r0=70(x), r1=150(y), r2=56(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 150
LDI r2, 56
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
