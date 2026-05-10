; DESCRIPTION: Renders a magenta box of size 65x117 starting at (183, 27).
; PLAN: r0=183(x), r1=27(y), r2=65(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 27
LDI r2, 65
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
