; DESCRIPTION: Renders a magenta box of size 28x19 starting at (23, 129).
; PLAN: r0=23(x), r1=129(y), r2=28(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 129
LDI r2, 28
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
