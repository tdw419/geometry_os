; DESCRIPTION: Renders a magenta box of size 11x39 starting at (407, 210).
; PLAN: r0=407(x), r1=210(y), r2=11(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 210
LDI r2, 11
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
