; DESCRIPTION: Renders a magenta box of size 109x38 starting at (55, 27).
; PLAN: r0=55(x), r1=27(y), r2=109(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 27
LDI r2, 109
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
