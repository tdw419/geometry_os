; DESCRIPTION: Renders a magenta box of size 28x54 starting at (125, 49).
; PLAN: r0=125(x), r1=49(y), r2=28(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 49
LDI r2, 28
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
