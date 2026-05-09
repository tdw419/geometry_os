; DESCRIPTION: Renders a magenta box of size 28x33 starting at (63, 220).
; PLAN: r0=63(x), r1=220(y), r2=28(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 220
LDI r2, 28
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
