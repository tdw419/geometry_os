; DESCRIPTION: Renders a magenta box of size 28x113 starting at (373, 112).
; PLAN: r0=373(x), r1=112(y), r2=28(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 112
LDI r2, 28
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
