; DESCRIPTION: Renders a magenta box of size 48x39 starting at (268, 102).
; PLAN: r0=268(x), r1=102(y), r2=48(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 102
LDI r2, 48
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
