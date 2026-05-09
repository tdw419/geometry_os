; DESCRIPTION: Renders a magenta box of size 33x12 starting at (129, 204).
; PLAN: r0=129(x), r1=204(y), r2=33(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 204
LDI r2, 33
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
